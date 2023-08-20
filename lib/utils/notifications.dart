import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static final notificationsPlugin = FlutterLocalNotificationsPlugin();

  static initialize() async {
    const settingsAndroid = AndroidInitializationSettings('drawable/icon');
    final settingsIos = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );
    final initSettings = InitializationSettings(
      android: settingsAndroid,
      iOS: settingsIos,
    );
    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) async {},
    );
    notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails,
      payload: payload,
    );
  }

  static const _notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'notification_channel',
      'channelName',
      fullScreenIntent: true,
      importance: Importance.high,
    ),
    iOS: DarwinNotificationDetails(),
  );
}
