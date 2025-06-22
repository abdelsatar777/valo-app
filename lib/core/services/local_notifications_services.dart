import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotificationsServices {
  // Initialization
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("app_icon"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //Basic Notification
  static void basicNotification({required bool value}) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "id 0",
      "basic notification",
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(
        value
            ? "You’ll now receive daily updates about the latest additions, agent tweaks, and VALO news."
            : "You’ve turned off notifications. You won’t receive updates about the latest game changes.",
        contentTitle:
            value ? "Notifications Enabled" : "Notifications Disabled",
      ),
    );

    NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(0, null, null, details);
  }

  //Repeated Notification
  static void repeatedNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 1",
        "repeated notification",
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(
          "VALORANT Daily Digest",
          contentTitle:
              "Stay informed with the newest updates, features, and balance changes.",
        ),
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      null,
      null,
      RepeatInterval.everyMinute,
      details,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  //Cancel Notification
  static void cancelNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
