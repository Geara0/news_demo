import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_demo/layouts/main/main_layout.dart';
import 'package:news_demo/layouts/events/events_layout.dart';
import 'package:news_demo/pages/splash/splash_page.dart';
import 'package:news_demo/pages/login/login_page.dart';
import 'package:news_demo/pages/onboarding/onboarding_page.dart';
import 'package:news_demo/pages/main/main_page.dart';
import 'package:news_demo/pages/news/news_page.dart';
import 'package:news_demo/pages/news/news_modal.dart';
import 'package:news_demo/pages/profile/profile_page.dart';
import 'package:news_demo/pages/profile/user_events/user_events_page.dart';
import 'package:news_demo/pages/profile/user_events/user_events_archive_page.dart';
import 'package:news_demo/pages/placeholder/placeholder_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Layout')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashPageRoute.page,
          path: '/',
        ),
        CustomRoute(
          page: LoginPageRoute.page,
          path: '/login',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: OnboardingPageRoute.page,
          path: '/onboarding',
          fullscreenDialog: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(0, -1),
              ).animate(secondaryAnimation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: child,
              ),
            );
          },
        ),
        AutoRoute(
          page: MainLayoutRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: EventsLayoutRoute.page,
              path: '',
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: MainPageRoute.page,
                ),
                AutoRoute(
                  path: 'news',
                  page: NewsPageRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: '',
              page: _EmptyRoute.page,
              children: [
                AutoRoute(
                  path: 'profile',
                  page: ProfilePageRoute.page,
                ),
                AutoRoute(
                  path: 'user_events',
                  page: UserEventsPageRoute.page,
                ),
                AutoRoute(
                  path: 'user_events_archive',
                  page: UserEventsArchivePageRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'placeholder',
              page: PlaceholderPageRoute.page,
            ),
          ],
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          opaque: false,
          path: '/modal',
          fullscreenDialog: true,
          page: NewsModalRoute.page,
        ),
      ];
}

@RoutePage()
class _Empty extends AutoRouter {}
