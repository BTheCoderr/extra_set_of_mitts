import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/job.dart';
import '../bloc/job_bloc.dart';
import '../widgets/task_list_item.dart';
import '../widgets/photo_upload_section.dart';
import '../widgets/job_timer.dart';
import '../../../../core/utils/location_service.dart';

class JobDetailsPage extends StatelessWidget {
  final Job job;

  const JobDetailsPage({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobBloc, JobState>(
      listener: (context, state) {
        if (state is JobError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is GeofenceError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Location Error'),
              content: const Text(
                'You appear to be outside the job location. '
                'Please ensure you are at the correct address.'
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(job.customerName),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // TODO: Implement navigation to maps
                LocationService.openInMaps(job.latitude, job.longitude);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job Status Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          job.status.toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: _getStatusColor(job.status),
                          ),
                        ),
                        if (job.status == 'in_progress')
                          const JobTimer(),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Job Details Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        _buildDetailRow(
                          context,
                          'Address',
                          job.address,
                          Icons.location_on,
                        ),
                        _buildDetailRow(
                          context,
                          'Scheduled Time',
                          '${_formatTime(job.startTime)} - ${_formatTime(job.endTime)}',
                          Icons.access_time,
                        ),
                        if (job.requiresKey)
                          _buildDetailRow(
                            context,
                            'Key Required',
                            'Yes',
                            Icons.key,
                          ),
                        _buildDetailRow(
                          context,
                          'Payment',
                          '\$${job.payment.amount}',
                          Icons.payment,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Tasks Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tasks',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: job.tasks.length,
                          itemBuilder: (context, index) {
                            final task = job.tasks[index];
                            return TaskListItem(
                              task: task,
                              onCompleted: (isCompleted) {
                                context.read<JobBloc>().add(
                                  UpdateTaskStatus(
                                    jobId: job.id,
                                    taskId: task.id,
                                    completed: isCompleted,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Photos Section
                PhotoUploadSection(
                  jobId: job.id,
                  existingPhotos: job.photos,
                  onPhotosUploaded: (photos) {
                    context.read<JobBloc>().add(
                      UploadJobPhotos(
                        jobId: job.id,
                        photos: photos,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: job.status == 'pending'
                ? () => _startJob(context)
                : null,
            child: Text(
              job.status == 'pending' ? 'Start Job' : 'In Progress',
            ),
          ),
        ),
      ),
    );
  }

  void _startJob(BuildContext context) async {
    final location = await LocationService.getCurrentLocation();
    if (location != null) {
      context.read<JobBloc>().add(
        StartJob(
          jobId: job.id,
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );
    }
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'delayed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
} 