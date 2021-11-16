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

  //Instant Notifications
  // Future instantNofitication() async {
  //   var android = const AndroidNotificationDetails('id', 'channel');
  //
  //   var ios = IOSNotificationDetails();
  //
  //   var platform =  NotificationDetails(android: android, iOS: ios);
  //
  //   await _flutterLocalNotificationsPlugin.show(
  //       0, "Demo instant notification", "Tap to do something", platform,
  //       payload: "Welcome to demo app");
  // }
  //
  // //Image notification
  // Future imageNotification() async {
  //   var bigPicture = BigPictureStyleInformation(
  //       DrawableResourceAndroidBitmap("ic_launcher"),
  //       largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
  //       contentTitle: "Demo image notification",
  //       summaryText: "This is some text",
  //       htmlFormatContent: true,
  //       htmlFormatContentTitle: true);
  //
  //   var android = AndroidNotificationDetails("id", "channel", "description",
  //       styleInformation: bigPicture);
  //
  //   var platform = new NotificationDetails(android: android);
  //
  //   await _flutterLocalNotificationsPlugin.show(
  //       0, "Demo Image notification", "Tap to do something", platform,
  //       payload: "Welcome to demo app");
  // }
  //
  // //Stylish Notification
  // Future stylishNotification() async {
  //   var android = AndroidNotificationDetails("id", "channel", "description",
  //       color: Colors.deepOrange,
  //       enableLights: true,
  //       enableVibration: true,
  //       largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
  //       styleInformation: MediaStyleInformation(
  //           htmlFormatContent: true, htmlFormatTitle: true));
  //
  //   var platform = new NotificationDetails(android: android);
  //
  //   await _flutterLocalNotificationsPlugin.show(
  //       0, "Demo Stylish notification", "Tap to do something", platform);
  // }

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
