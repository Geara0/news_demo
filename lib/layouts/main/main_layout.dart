import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';
import 'package:news_demo/router/router.dart';

@RoutePage()
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: child,
          bottomNavigationBar: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
            child: SizedBox(
              height: 55,
              child: TabBar(
                onTap: (i) {
                  debugPrint(i.toString());
                  tabsRouter.setActiveIndex(i, notify: true);
                },
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: const Icon(Icomoon.home),
                    text: 'mainLayout.tabs.main'.tr(),
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    icon: const Icon(Icomoon.calendar),
                    text: 'mainLayout.tabs.events'.tr(),
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    icon: const Icon(Icomoon.chat),
                    text: 'mainLayout.tabs.chat'.tr(),
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    icon: const Icon(Icons.circle),
                    text: 'mainLayout.tabs.profile'.tr(),
                    iconMargin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      routes: const [
        MainPageRoute(),
        PlaceholderPageRoute(),
        PlaceholderPageRoute(),
        ProfilePageRoute(),
      ],
    );
  }
}
