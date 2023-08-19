import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_demo/widgets/colored_button/colored_button.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final _pageController = PageController();
  late final _textController = PageController();
  late final _tabController = TabController(
    length: pagesLength,
    vsync: this,
  );

  var _currentPage = 0;

  int get pagesLength => _images.length;

  bool get isEndPage => _currentPage == pagesLength - 1;

  final List<Image> _images = [
    Image.asset('assets/onboarding/1.jpg', fit: BoxFit.cover),
    Image.asset('assets/onboarding/2.jpg', fit: BoxFit.cover),
    Image.asset('assets/onboarding/3.jpg', fit: BoxFit.cover),
  ];

  late final List<Widget> _headers = _parseHeaders([
    ('onboarding.services.title', 'onboarding.services.subtitle'),
    ('onboarding.notifications.title', 'onboarding.notifications.subtitle'),
    ('onboarding.events.title', 'onboarding.events.subtitle'),
  ]);

  @override
  Widget build(BuildContext context) {
    assert(_images.length == _headers.length);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: _images,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 13),
                      if (!isEndPage)
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,
                            child: ColoredButton(
                              backgroundColor: Colors.white30,
                              onPressed: _endOnboarding,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'onboarding.buttons.skip',
                                style: TextStyle(fontSize: 12),
                              ).tr(),
                            ),
                          ),
                        ),
                      Expanded(
                        child: PageView(
                          controller: _textController,
                          children: _headers,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _nextPage,
                          child: !isEndPage
                              ? const Text('onboarding.buttons.next').tr()
                              : const Text('onboarding.buttons.start').tr(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PageIndicator(
                        controller: _pageController,
                        count: pagesLength,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _parseHeaders(Iterable<(String, String)> headers) {
    var res = <Widget>[];

    for (var header in headers) {
      final (title, subtitle) = header;
      res.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    return res;
  }

  void _nextPage() {
    if (isEndPage) {
      _endOnboarding();
      return;
    }

    for (var controller in [_textController, _pageController]) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    setState(() {
      _currentPage++;
      _tabController.index = _currentPage;
    });
  }

  void _endOnboarding() {
    context.router.pop();
  }
}
