import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/router/router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    _loadData().then((value) => _endSplash(context));

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset('assets/icon/icon.png'),
        ),
      ),
    );
  }

  // Допустим, ждем данные с сервера
  Future<void> _loadData() {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  void _endSplash(BuildContext context) {
    context.router.replace(const LoginPageRoute());
  }
}
