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
                title: '412412341234123412341234123412412423141234',
                role: '523452345234524352345',
                date: '23 23 23 234',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}