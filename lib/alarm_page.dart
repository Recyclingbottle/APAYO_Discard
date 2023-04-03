import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    show
    AndroidInitializationSettings,
    AndroidNotificationDetails,
    IOSInitializationSettings,
    IOSNotificationDetails,
    InitializationSettings,
    NotificationDetails,
    FlutterLocalNotificationsPlugin,
    RawResourceAndroidNotificationSound,
    Importance,
    Priority,
    UILocalNotificationDateInterpretation;
import 'package:flutter_local_notifications/flutter_local_notifications.dart' show IOSInitializationSettings, IOSNotificationDetails;


class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final List<TimeOfDay> alarms = [];

  @override
  void initState() {
    super.initState();

    // 로컬 알림 초기화
    final initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('약 알림'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${alarms[index].hour}:${alarms[index].minute.toString()
                          .padLeft(2, '0')}',
                      style: TextStyle(fontSize: 20)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        alarms.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // 알람 추가
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  alarms.add(time);
                });
              }
            },
            child: Text('알람 추가'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // 알람 울리기
              alarms.forEach((time) {
                final now = DateTime.now();
                final alarmTime =
                DateTime(now.year, now.month, now.day, time.hour, time.minute);
                if (now.isAfter(alarmTime)) {
                  alarmTime.add(Duration(days: 1));
                }
                _scheduleAlarm(alarmTime);
              });
            },
            child: Text('알람 울리기'),
          ),
        ],
      ),
    );
  }

  void _scheduleAlarm(DateTime alarmTime) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'alarm_notif', 'Channel for Alarm notification',
        icon: '@mipmap/ic_launcher',
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        importance: Importance.max,
        priority: Priority.high);
    final platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Scheduled title',
        'Scheduled body',
        tz.TZDateTime.from(alarmTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}