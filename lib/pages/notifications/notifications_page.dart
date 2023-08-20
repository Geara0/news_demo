import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';
import 'package:news_demo/utils/notifications.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('notificationsPage.title').tr()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icomoon.bell),
        onPressed: () {
          setState(() => _counter++);
          Notifications.showNotification(
            id: _counter,
            title: 'notificationsPage.notificationTitle'.tr(),
            body: 'notificationsPage.count'.tr(args: ['$_counter']),
          );
        },
      ),
      body: Center(
        child: const Text('notificationsPage.count').tr(args: ['$_counter']),
      ),
    );
  }
}
