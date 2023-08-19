import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_demo/router/router.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showButtons();
    });
  }

  @override
  Widget build(BuildContext context) {
    var buttons = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: _endLogin,
          child: const Text('login.ELK').tr(),
        ),
        const SizedBox(height: 16),
        FilledButton.tonal(
          onPressed: _endLogin,
          child: const Text('login.noAuth').tr(),
        ),
        const SizedBox(height: 32),
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/icon/icon.jpg'),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                child: SizedBox(
                  height: height,
                  child: buttons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _endLogin() {
    context.router.replace(const MainPageRoute());
    context.router.push(const OnboardingPageRoute());
  }

  void _showButtons() {
    setState(() => height = null);
  }
}
