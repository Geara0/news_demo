import 'package:flutter/material.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator_style.dart';

const primaryColor = Color(0xFFC60033);
const secondaryColor = Color(0xFFFDF0F4);
const tertiaryColor = Color(0xFFF5F5F5);

const font = 'Sansation';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    secondaryContainer: secondaryColor,
    onSecondaryContainer: primaryColor,
    // tertiaryContainer: tertiaryColor,
  ),
  useMaterial3: true,
  fontFamily: font,
  scaffoldBackgroundColor: Colors.white,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textStyle: const MaterialStatePropertyAll<TextStyle>(
        TextStyle(
          fontFamily: font,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.25,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll<Size>(Size(0, 55)),
    ),
  ),
  badgeTheme: const BadgeThemeData(
    backgroundColor: primaryColor,
    textColor: Colors.white,
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelPadding: EdgeInsets.zero,
    unselectedLabelStyle: const TextStyle(
      fontFamily: font,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelColor: Colors.grey,
    labelStyle: const TextStyle(
      fontFamily: font,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    labelColor: Colors.black,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: _CircleTabIndicator(
      color: primaryColor,
      radius: 2,
    ),
    dividerColor: Colors.transparent,
  ),
  chipTheme: const ChipThemeData(
    side: BorderSide(
      width: 0,
      color: Colors.transparent,
    ),
    showCheckmark: false,
    selectedColor: primaryColor,
    labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    secondaryLabelStyle: TextStyle(
      fontFamily: font,
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      fontFamily: font,
      color: Colors.black,
      fontSize: 14,
    ),
    backgroundColor: tertiaryColor,
  ),
  cardTheme: const CardTheme(
    elevation: 0,
    color: tertiaryColor,
  ),
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
      textStyle: MaterialStatePropertyAll<TextStyle>(
        TextStyle(
          fontFamily: font,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    PageIndicatorStyle(
      dotWidth: 8,
      dotHeight: 8,
      spacing: 6,
      dotColor: secondaryColor,
      activeDotColor: primaryColor,
      expansionFactor: 2,
    ),
  ],
);

class _CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  _CircleTabIndicator({
    required Color color,
    required double radius,
  }) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    assert(cfg.size != null);
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 3.5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
