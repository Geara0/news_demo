import 'dart:ui';

import 'package:flutter/material.dart';

class PageIndicatorStyle extends ThemeExtension<PageIndicatorStyle> {
  final double? dotWidth;
  final double? dotHeight;
  final double? spacing;
  final Color? dotColor;
  final Color? activeDotColor;
  final double? expansionFactor;

  PageIndicatorStyle({
    this.dotWidth,
    this.dotHeight,
    this.spacing,
    this.dotColor,
    this.activeDotColor,
    this.expansionFactor,
  });

  @override
  ThemeExtension<PageIndicatorStyle> copyWith({
    double? dotWidth,
    double? dotHeight,
    double? spacing,
    Color? dotColor,
    Color? activeDotColor,
    double? expansionFactor,
  }) {
    return PageIndicatorStyle(
      dotWidth: dotWidth ?? this.dotWidth,
      dotHeight: dotHeight ?? this.dotHeight,
      spacing: spacing ?? this.spacing,
      dotColor: dotColor ?? this.dotColor,
      activeDotColor: activeDotColor ?? this.activeDotColor,
      expansionFactor: expansionFactor ?? this.expansionFactor,
    );
  }

  @override
  ThemeExtension<PageIndicatorStyle> lerp(
      covariant ThemeExtension<PageIndicatorStyle>? other, double t) {
    if (other is! PageIndicatorStyle) {
      return this;
    }

    return PageIndicatorStyle(
      dotWidth: lerpDouble(dotWidth, other.dotWidth, t),
      dotHeight: lerpDouble(dotHeight, other.dotHeight, t),
      spacing: lerpDouble(spacing, other.spacing, t),
      dotColor: Color.lerp(dotColor, other.dotColor, t),
      activeDotColor: Color.lerp(activeDotColor, other.activeDotColor, t),
      expansionFactor: lerpDouble(expansionFactor, other.expansionFactor, t),
    );
  }
}
