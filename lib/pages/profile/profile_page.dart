import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';
import 'package:news_demo/router/router.dart';
import 'package:news_demo/widgets/profile/action_card.dart';
import 'package:news_demo/widgets/profile/profile_app_bar.dart';
import 'package:news_demo/widgets/profile/profile_card.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        cardTheme: themeData.cardTheme.copyWith(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFEBEDF0)),
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color(0xFFF9F9F9),
        ),
      ),
      child: Scaffold(
        appBar: const ProfileAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 19),
              ProfileCard(
                name: "profilePage.name".tr(),
                id: 1241,
                image: const AssetImage('assets/profile/img.png'),
                onTap: () {},
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'profilePage.main'.tr(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6D7885),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ActionCard(
                        text: 'profilePage.actions.notifications'.tr(),
                        icon: Icomoon.bell,
                        onTap: () {},
                      ),
                      ActionCard(
                        text: 'profilePage.actions.events'.tr(),
                        icon: Icomoon.calendar_outlined,
                        onTap: () {
                          context.router.push(const UserEventsPageRoute());
                        },
                      ),
                      ActionCard(
                        text: 'profilePage.actions.services'.tr(),
                        icon: Icomoon.suitcase,
                        onTap: () {},
                      ),
                      ActionCard(
                        text: 'profilePage.actions.status'.tr(),
                        icon: Icomoon.mark,
                        onTap: () {},
                      ),
                      ActionCard(
                        text: 'profilePage.actions.settings'.tr(),
                        icon: Icomoon.settings,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const _ExitCard(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExitCard extends StatelessWidget {
  const _ExitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Text(
                  'profilePage.exit'.tr(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icomoon.exit,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
