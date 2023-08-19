import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/widgets/secondary_app_bar/secondary_app_bar.dart';
import 'package:news_demo/widgets/user_event_card/user_event_card.dart';

@RoutePage()
class UserEventsArchivePage extends StatelessWidget {
  const UserEventsArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        header: 'userEventsArchivePage.header'.tr(),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('userEventsArchivePage.clear').tr(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              UserEventCard(
                image: const AssetImage('assets/user_event/img.png'),
                title: 'userEventsArchivePage.1.header'.tr(),
                role: 'userEventsArchivePage.1.role'.tr(),
                date: 'userEventsArchivePage.1.date'.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
