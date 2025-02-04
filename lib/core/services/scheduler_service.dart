import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../utils/date_time_utils.dart';
import '../../data/models/job.dart';
import 'notification_service.dart';
import 'hive_service.dart';

class SchedulerService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  final HiveService _hiveService;

  SchedulerService(this._hiveService) {
    tz.initializeTimeZones();
  }

  // Schedule a job
  Future<void> scheduleJob(JobModel job) async {
    // Save job to local storage
    await _hiveService.saveJob(job);

    // Schedule local notifications for the job
    await _scheduleNotifications(job);

    // Notify about new job assignment
    await NotificationService.showJobAssignmentNotification(
      job.id,
      job.customerName,
    );
  }

  // Schedule a reminder for job start time
  Future<void> _scheduleStartTimeReminder(JobModel job) async {
    final scheduledDate = job.scheduledStartTime.subtract(const Duration(minutes: 30));
    if (scheduledDate.isAfter(DateTime.now())) {
      await _notifications.zonedSchedule(
        int.parse(job.id),
        'Upcoming Job',
        'Your job at ${job.customerName} starts in 30 minutes',
        tz.TZDateTime.from(scheduledDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'job_reminders',
            'Job Reminders',
            channelDescription: 'Notifications for job reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  // Schedule a reminder for job end time
  Future<void> _scheduleEndTimeReminder(JobModel job) async {
    final scheduledDate = job.scheduledEndTime.subtract(const Duration(minutes: 15));
    if (scheduledDate.isAfter(DateTime.now())) {
      await _notifications.zonedSchedule(
        int.parse(job.id) + 1,
        'Job Ending Soon',
        'Your job at ${job.customerName} ends in 15 minutes',
        tz.TZDateTime.from(scheduledDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'job_reminders',
            'Job Reminders',
            channelDescription: 'Notifications for job reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  // Cancel all scheduled notifications for a job
  Future<void> cancelJobSchedule(String jobId) async {
    await _notifications.cancel(int.parse(jobId));
    await _notifications.cancel(int.parse(jobId) + 1);
  }

  // Get all scheduled jobs for a specific day
  Future<List<JobModel>> getJobsForDate(DateTime date) async {
    final jobs = await _hiveService.getJobs();
    return jobs.where((job) =>
      job.scheduledStartTime.year == date.year &&
      job.scheduledStartTime.month == date.month &&
      job.scheduledStartTime.day == date.day
    ).toList();
  }

  // Get all scheduled jobs for a specific week
  Future<List<JobModel>> getJobsForWeek(DateTime weekStart) async {
    final weekEnd = weekStart.add(const Duration(days: 7));
    final jobs = await _hiveService.getJobs();
    return jobs.where((job) =>
      job.scheduledStartTime.isAfter(weekStart) &&
      job.scheduledStartTime.isBefore(weekEnd)
    ).toList();
  }

  // Check for scheduling conflicts
  bool hasTimeConflict(JobModel newJob, List<JobModel> existingJobs) {
    return existingJobs.any((job) =>
      job.assignedContractors.any((id) => newJob.assignedContractors.contains(id)) &&
      _timesOverlap(
        job.scheduledStartTime,
        job.scheduledEndTime.difference(job.scheduledStartTime),
        newJob.scheduledStartTime,
        newJob.scheduledEndTime.difference(newJob.scheduledStartTime),
      ));
  }

  bool _timesOverlap(
    DateTime start1,
    Duration duration1,
    DateTime start2,
    Duration duration2,
  ) {
    final end1 = start1.add(duration1);
    final end2 = start2.add(duration2);
    return start1.isBefore(end2) && end1.isAfter(start2);
  }

  // Get available time slots for a specific day
  Future<List<TimeSlot>> getAvailableTimeSlots(
    DateTime date,
    Duration jobDuration,
  ) async {
    final dayJobs = await getJobsForDate(date);
    final workingHours = DateTimeUtils.getWorkingHours(date);
    
    return DateTimeUtils.findAvailableSlots(
      workingHours.start,
      workingHours.end,
      dayJobs,
      jobDuration,
    );
  }

  Future<void> _scheduleNotifications(JobModel job) async {
    await _scheduleStartTimeReminder(job);
    await _scheduleEndTimeReminder(job);
  }
} 