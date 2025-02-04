import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/job.dart';
import '../../domain/entities/job_status.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/job/job_bloc.dart';
import '../widgets/profile_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<JobBloc>().add(LoadJobs());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProfileAvatar(),
        ),
        title: Text(_getGreeting()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Today'),
            Tab(text: 'This Week'),
            Tab(text: 'Next Week'),
          ],
        ),
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JobLoaded) {
            return TabBarView(
              controller: _tabController,
              children: [
                _buildJobList(state.jobs, JobTimeFilter.today),
                _buildJobList(state.jobs, JobTimeFilter.thisWeek),
                _buildJobList(state.jobs, JobTimeFilter.nextWeek),
              ],
            );
          } else if (state is JobError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No jobs available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-job'),
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildJobList(List<Job> jobs, JobTimeFilter filter) {
    final filteredJobs = _filterJobs(jobs, filter);
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredJobs.length,
      itemBuilder: (context, index) {
        final job = filteredJobs[index];
        final canStart = _canStartJob(job, filteredJobs, index);
        
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              '/job-details',
              arguments: job,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(job.customerName),
                  subtitle: Text(job.address),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.directions),
                        color: Colors.blue,
                        onPressed: () => _launchMaps(job.address),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${DateFormat('h:mm a').format(job.scheduledStartTime)} - ${DateFormat('h:mm a').format(job.scheduledEndTime)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: _getStatusColor(job.status, canStart),
                  child: Text(
                    _getStatusText(job.status, canStart),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Job> _filterJobs(List<Job> jobs, JobTimeFilter filter) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final startOfNextWeek = startOfWeek.add(const Duration(days: 7));

    switch (filter) {
      case JobTimeFilter.today:
        return jobs.where((job) => 
          job.scheduledStartTime.year == now.year &&
          job.scheduledStartTime.month == now.month &&
          job.scheduledStartTime.day == now.day
        ).toList();
      case JobTimeFilter.thisWeek:
        return jobs.where((job) => 
          job.scheduledStartTime.isAfter(startOfWeek) &&
          job.scheduledStartTime.isBefore(startOfNextWeek)
        ).toList();
      case JobTimeFilter.nextWeek:
        return jobs.where((job) => 
          job.scheduledStartTime.isAfter(startOfNextWeek) &&
          job.scheduledStartTime.isBefore(startOfNextWeek.add(const Duration(days: 7)))
        ).toList();
    }
  }

  bool _canStartJob(Job job, List<Job> jobs, int currentIndex) {
    if (currentIndex == 0) return true;
    final previousJob = jobs[currentIndex - 1];
    return previousJob.status == JobStatus.completed;
  }

  Color _getStatusColor(JobStatus status, bool canStart) {
    switch (status) {
      case JobStatus.completed:
        return Colors.green;
      case JobStatus.inProgress:
        return Colors.blue;
      case JobStatus.pending:
        return canStart ? Colors.green : Colors.grey;
      case JobStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(JobStatus status, bool canStart) {
    switch (status) {
      case JobStatus.completed:
        return 'Completed';
      case JobStatus.inProgress:
        return 'In Progress';
      case JobStatus.pending:
        return canStart ? 'Start Job' : 'Not Available';
      case JobStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  void _launchMaps(String address) {
    // TODO: Implement map launching
  }
}

enum JobTimeFilter {
  today,
  thisWeek,
  nextWeek,
} 