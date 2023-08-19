import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/router/router.dart';
import 'package:news_demo/theme.dart';
import 'package:news_demo/widgets/main_app_bar/main_app_bar.dart';

@RoutePage()
class EventsLayout extends StatelessWidget {
  const EventsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: AutoTabsRouter.pageView(
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, child, _) {
          final tabsRouter = context.tabsRouter;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CupertinoSlidingSegmentedControl(
                  backgroundColor: tertiaryColor,
                  groupValue: tabsRouter.activeIndex,
                  children: {
                    0: Text(
                      'eventsLayout.tabs.events'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        height: 2.4,
                      ),
                    ),
                    1: Text(
                      'eventsLayout.tabs.news'.tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, height: 2.4),
                    ),
                  },
                  onValueChanged: (int? i) {
                    tabsRouter.setActiveIndex(i!);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: child,
              ),
              const SizedBox(height: 16),
            ],
          );
        },
        routes: const [
          MainPageRoute(),
          NewsPageRoute(),
        ],
      ),
    );
  }
}
