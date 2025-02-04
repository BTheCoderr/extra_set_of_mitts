import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // Initialize local notifications
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  static void _onNotificationTap(NotificationResponse response) {
    // TODO: Handle local notification tap
    // Navigate to appropriate screen based on payload
  }

  static Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      channelDescription: 'Default notification channel',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      DateTime.now().millisecond,
      title,
      body,
      details,
      payload: payload,
    );
  }

  // Helper method to show job assignment notification
  static Future<void> showJobAssignmentNotification(String jobId, String customerName) async {
    await _showLocalNotification(
      title: 'New Job Assigned',
      body: 'You have been assigned to clean for $customerName',
      payload: 'job_$jobId',
    );
  }

  // Helper method to show job status update notification
  static Future<void> showJobStatusUpdateNotification(String jobId, String status) async {
    await _showLocalNotification(
      title: 'Job Status Update',
      body: 'Job #$jobId has been marked as $status',
      payload: 'job_$jobId',
    );
  }

  // Helper method to show task completion notification
  static Future<void> showTaskCompletionNotification(String jobId, String taskName) async {
    await _showLocalNotification(
      title: 'Task Completed',
      body: 'Task "$taskName" has been marked as complete',
      payload: 'job_$jobId',
    );
  }

  // Helper method to show photo upload success notification
  static Future<void> showPhotoUploadSuccessNotification(String jobId, int count) async {
    await _showLocalNotification(
      title: 'Photos Uploaded',
      body: '$count photo${count == 1 ? '' : 's'} uploaded successfully for job #$jobId',
      payload: 'job_$jobId',
    );
  }

  // Helper method to show payment received notification
  static Future<void> showPaymentReceivedNotification(String jobId, double amount) async {
    await _showLocalNotification(
      title: 'Payment Received',
      body: 'Payment of \$${amount.toStringAsFixed(2)} received for job #$jobId',
      payload: 'job_$jobId',
    );
  }
} 