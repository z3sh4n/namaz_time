import 'dart:core';

import 'package:flutter/material.dart';
import 'package:sdfsdf/features/namaz_time/domain/entities/namaz_time_entity.dart';
import 'package:sdfsdf/features/notification_remain_time/services/notification_service.dart';
import 'package:sdfsdf/features/notification_remain_time/services/receive_notification.dart';

class TimingController {
  final List<NamazTimeEntity> namazTime;

  /// index of the prayer timing
  int _timingCount = 0;

  /// weather to look for result for tomorrow

  /// list to store data for each prayer timing
  late final List<Map<String, String>> _timingsList;

  TimingController(this.namazTime) {
    _timingsList = [
      {namazTime[0].namazName: namazTime[0].namazTime.split('AM')[0]},
      {namazTime[1].namazName: namazTime[1].namazTime.split('AM')[0]},
      {namazTime[2].namazName: namazTime[2].namazTime.split('PM')[0]},
      {namazTime[3].namazName: namazTime[3].namazTime.split('PM')[0]},
      {namazTime[4].namazName: namazTime[4].namazTime.split('PM')[0]},
      {namazTime[5].namazName: namazTime[5].namazTime.split('PM')[0]},
    ];
    getTimingCount();
  }

  /// find which prayer time is next according to current time
  void getTimingCount() {
    final DateTime currentTime = DateTime.now();
    final hours = currentTime.hour;
    final mins = currentTime.minute;

    for (final Map<String, String> timing in _timingsList) {
      final timingHour = timing.entries.first.value.split(':')[0];
      final timingMin = timing.entries.first.value.split(':')[1];
      // print(timing.entries.first.value);

      if (int.parse(timingHour) < hours) {
        _timingCount++;
      } else if (int.parse(timingHour) == hours &&
          int.parse(timingMin) <= mins) {
        _timingCount++;
      }
    }
    // print('asdfsdfsdfasdf$_timingCount');

    if (_timingCount == 5) {
      _timingCount = 0;
    }
  }

  /// if index is 5, this means today's prayer timing is finished,
  /// hence, the index is back to 0 (for the next day)
  int get timingCount => _timingCount;
  List<Map<String, String>> get timingsList => _timingsList;
  Map<String, String> get currentTiming => _timingsList[_timingCount];
  String get prayer => _timingsList[_timingCount].entries.first.key;
  String get time => _timingsList[_timingCount].entries.first.value;
}

Future<List<Map<String, Object>>> loadLocalNotification(
    List<Map<String, String>> timingsList) async {
  // empty list of notification
  final List<Map<String, Object>> notificationList = [];

  // id for notification
  int i = 0;

  await Future.forEach(timingsList, (Map<String, String> timing) async {
    // here we get excact min and time of namaz time
    final timingHour = int.parse(timing.entries.first.value.split(':')[0]);
    final timingMin = int.parse(timing.entries.first.value.split(':')[1]);

    // giving today duration - namaz time duration like this
    //-5:27:21.910087
    // 1:21:38.087939
    // 4:27:38.087566
    // 6:49:38.087245
    // 8:19:38.086971
    Duration duration = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timingHour,
      timingMin,
    ).difference(DateTime.now());

//  if todays hour is more than timinghour it will increase day

    duration = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
      timingHour,
      timingMin,
    ).difference(DateTime.now());
    // print(duration);

    // adding namaz notificaiton from duration and title
    notificationList.add({
      'id': i,
      'title': timing.entries.first.key,
      'body': 'The next prayer time is now.',
      'duration': duration,
    });

    i++;
    // print(i);
  });
  return notificationList;
}

Future<void> addToLocalNotification(
    List<Map<String, Object>> notifications) async {
  // first it will cancel all notification
  await NotificationService().cancelAllNotifications();

// load notification from showPrayerNotification and load details from load notification
  await Future.forEach(notifications, (Map<String, Object> notification) async {
    // print(notification);

//  {id: 0, title: Fajr, body: The next prayer time is now., duration: 14:49:27.140458}
//  {id: 1, title: Sunrise, body: The next prayer time is now., duration: 16:08:27.138893}
//  {id: 2, title: Duhur, body: The next prayer time is now., duration: 21:37:27.138618}
//  {id: 3, title: Asr, body: The next prayer time is now., duration: 13:28:27.138395}
//  {id: 4, title: Maghrib, body: The next prayer time is now., duration: 15:04:27.138183}
//  {id: 5, title: Isha, body: The next prayer time is now., duration: 16:22:27.137950}

    await NotificationService().showPrayerNotification(
      id: notification['id'] as int,
      title: notification['title'].toString(),
      body: notification['body'].toString(),
      duration: notification['duration'] as Duration,
    );
  });
}

/// dont forget to add this in initState

void configureDidReceiveLocalNotificationSubject(BuildContext context) {
  NotificationService()
      .didReceiveLocalNotificationSubject
      .stream
      .listen((ReceivedNotification receivedNotification) async {
    // await Navigator.of(context).pushNamed(RouteGenerator.prayerTimingPage);
  });
}

void configureSelectNotificationSubject(BuildContext context) {
  NotificationService()
      .selectNotificationSubject
      .stream
      .listen((String? payload) async {
    // await Navigator.of(context).pushNamed(RouteGenerator.prayerTimingPage);
  });
}
