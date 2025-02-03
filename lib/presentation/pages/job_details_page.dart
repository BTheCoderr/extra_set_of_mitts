import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/job.dart';
import '../bloc/job/job_bloc.dart';
import '../widgets/task_list_item.dart';
import '../widgets/photo_upload_section.dart';
import '../widgets/job_timer.dart';

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
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          geofenceError: () {
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
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(job.customerName),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // TODO: Implement navigation
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
                          job.status.name.toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: _getStatusColor(job.status),
                          ),
                        ),
                        if (job.status == JobStatus.inProgress)
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
                          '${_formatTime(job.scheduledStartTime)} - '
                          '${_formatTime(job.scheduledEndTime)}',
                          Icons.access_time,
                        ),
                        if (job.requiresKey)
                          _buildDetailRow(
                            context,
                            'Key Required',
                            'Yes',
                            Icons.key,
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
                            return TaskListItem(
                              task: job.tasks[index],
                              onCompleted: (isCompleted) {
                                context.read<JobBloc>().add(
                                  JobEvent.completeTask(
                                    jobId: job.id,
                                    taskId: job.tasks[index].id,
                                    completedBy: 'current_user_id', // TODO: Get from auth
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

                if (job.photosRequired) ...[
                  const SizedBox(height: 16),
                  PhotoUploadSection(
                    jobId: job.id,
                    onPhotosSelected: (photos) {
                      // TODO: Implement photo upload
                    },
                  ),
                ],
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
            onPressed: job.status == JobStatus.pending
                ? () => _startJob(context)
                : null,
            child: Text(
              job.status == JobStatus.pending ? 'Start Job' : 'In Progress',
            ),
          ),
        ),
      ),
    );
  }

  void _startJob(BuildContext context) {
    // TODO: Get current location
    context.read<JobBloc>().add(
      JobEvent.startJob(
        jobId: job.id,
        location: const GeoLocation(
          latitude: 0,
          longitude: 0,
        ),
      ),
    );
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

  Color _getStatusColor(JobStatus status) {
    switch (status) {
      case JobStatus.pending:
        return Colors.orange;
      case JobStatus.inProgress:
        return Colors.blue;
      case JobStatus.completed:
        return Colors.green;
      case JobStatus.cancelled:
        return Colors.red;
      case JobStatus.delayed:
        return Colors.purple;
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
} 