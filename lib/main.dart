import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/router/router.dart';
import 'package:news_demo/theme.dart';
import 'package:news_demo/utils/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Notifications.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _appRouter.config(),
      theme: theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
