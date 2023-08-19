import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/widgets/event_card/event_card.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator_style.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _cardController = PageController(viewportFraction: 0.9);
  final _cards = List.generate(
    3,
    (i) => EventCard(
      date: 'mainPage.card.date'.tr(),
      title: 'mainPage.card.title'.tr(),
      place: 'mainPage.card.place'.tr(),
      icon: const AssetImage('assets/card/icon.png'),
      background: const AssetImage('assets/card/background.png'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        Theme.of(context).extension<PageIndicatorStyle>()!.copyWith(
              activeDotColor: const Color(0xFF212122),
            ),
      ],
    );
    return Theme(
      data: themeData,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _cardController,
              children: _parseCards(_cards),
            ),
          ),
          const SizedBox(height: 16),
          PageIndicator(
            controller: _cardController,
            count: _cards.length,
          ),
        ],
      ),
    );
  }

  List<Widget> _parseCards(List<Widget> cards) {
    return cards
        .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: e,
            ))
        .toList();
  }
}
