import 'package:extra_set_of_mitts/data/models/job.dart';

class WorkingHours {
  final DateTime start;
  final DateTime end;

  const WorkingHours({
    required this.start,
    required this.end,
  });
}

class TimeSlot {
  final DateTime start;
  final DateTime end;

  const TimeSlot({
    required this.start,
    required this.end,
  });

  Duration get duration => end.difference(start);
}

class DateTimeUtils {
  static const int workingStartHour = 8; // 8 AM
  static const int workingEndHour = 18; // 6 PM

  // Get working hours for a specific date
  static WorkingHours getWorkingHours(DateTime date) {
    // Default working hours: 9 AM to 5 PM
    final start = DateTime(date.year, date.month, date.day, 9);
    final end = DateTime(date.year, date.month, date.day, 17);
    return WorkingHours(start: start, end: end);
  }

  // Check if two time ranges overlap
  static bool hasTimeOverlap(
    DateTime start1,
    DateTime end1,
    DateTime start2,
    DateTime end2,
  ) {
    return start1.isBefore(end2) && end1.isAfter(start2);
  }

  // Find available time slots for a specific day
  static List<TimeSlot> findAvailableSlots(
    DateTime start,
    DateTime end,
    List<JobModel> existingJobs,
    Duration jobDuration,
  ) {
    final slots = <TimeSlot>[];
    var currentTime = start;

    while (currentTime.add(jobDuration).isBefore(end)) {
      final proposedEndTime = currentTime.add(jobDuration);
      bool isSlotAvailable = true;

      for (final job in existingJobs) {
        if (_timesOverlap(
          currentTime,
          jobDuration,
          job.scheduledStartTime,
          job.scheduledEndTime.difference(job.scheduledStartTime),
        )) {
          isSlotAvailable = false;
          break;
        }
      }

      if (isSlotAvailable) {
        slots.add(TimeSlot(
          start: currentTime,
          end: proposedEndTime,
        ));
      }

      currentTime = currentTime.add(const Duration(minutes: 30));
    }

    return slots;
  }

  static bool _timesOverlap(
    DateTime start1,
    Duration duration1,
    DateTime start2,
    Duration duration2,
  ) {
    final end1 = start1.add(duration1);
    final end2 = start2.add(duration2);
    return start1.isBefore(end2) && end1.isAfter(start2);
  }

  // Format duration to string (e.g., "2h 30m")
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  // Get the start of the week containing the given date
  static DateTime getWeekStart(DateTime date) {
    final daysToSubtract = date.weekday - DateTime.monday;
    return DateTime(
      date.year,
      date.month,
      date.day - daysToSubtract,
    );
  }

  // Check if a date is a weekend
  static bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  // Check if a time is within working hours
  static bool isWithinWorkingHours(DateTime time) {
    return time.hour >= workingStartHour && time.hour < workingEndHour;
  }

  // Get the next available working day
  static DateTime getNextWorkingDay(DateTime date) {
    var nextDay = date.add(const Duration(days: 1));
    while (isWeekend(nextDay)) {
      nextDay = nextDay.add(const Duration(days: 1));
    }
    return nextDay;
  }

  // Calculate travel time between two jobs
  static Duration estimateTravelTime(JobModel job1, JobModel job2) {
    // TODO: Implement actual travel time calculation using a maps service
    // For now, return a fixed duration
    return const Duration(minutes: 30);
  }
} 