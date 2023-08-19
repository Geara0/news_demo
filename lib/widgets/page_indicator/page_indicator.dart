import 'package:flutter/material.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final PageIndicatorStyle? style;

  const PageIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<PageIndicatorStyle>();
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      // Я бы указал сразу нужные значения. Это сделано для демонстрации знания мной тем
      effect: ExpandingDotsEffect(
        dotWidth: style?.dotWidth ?? defaultStyle?.dotWidth ?? 16,
        dotHeight: style?.dotHeight ?? defaultStyle?.dotHeight ?? 16,
        spacing: style?.spacing ?? defaultStyle?.spacing ?? 8,
        dotColor: style?.dotColor ?? defaultStyle?.dotColor ?? Colors.grey,
        activeDotColor: style?.activeDotColor ??
            defaultStyle?.activeDotColor ??
            Colors.indigo,
        expansionFactor:
            style?.expansionFactor ?? defaultStyle?.expansionFactor ?? 3,
      ),
    );
  }
}
