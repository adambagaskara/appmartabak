// import 'dart:js_util';

import 'package:appmartabak/screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // static Future showBigTextNotification(
  //     {var id = 0,
  //     required String title,
  //     required String body,
  //     var payload,
  //     required FlutterLocalNotificationsPlugin fln}) async {
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       new AndroidNotificationDetails(('0'), 'channel_name', 'description',
  //           importance: Importance.max, priority: Priority.high);

  //   var not = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: IOSNotificationDetails());
  //   await fln.show(0, title, body, not);
  // }

  static showBigTextNotification(int id, String title, String body,
      String payload, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
