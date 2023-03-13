import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  //initilize

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher_background');

    IOSInitializationSettings iosInitializationSettings =
    const IOSInitializationSettings();

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  //Scheduled Notification

  Future scheduledNotification() async {
    var interval = RepeatInterval.hourly;
    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap('@mipmap/ic_launcher_background'),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher_background'),
        contentTitle: "Breath Time",
        summaryText: "Inhale-Hold-Exhale",
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("id", "channel",
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "Breathing Time",
        "Tap for Deep Breath",
        interval,
        platform);
  }

  //Cancel notification

  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
