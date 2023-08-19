import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  const ColoredButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget res = FilledButton(
      onPressed: onPressed,
      style: Theme.of(context).filledButtonTheme.style?.copyWith(
            minimumSize: const MaterialStatePropertyAll<Size>(Size(0, 0)),
            backgroundColor: MaterialStatePropertyAll<Color?>(backgroundColor),
            foregroundColor: MaterialStatePropertyAll<Color?>(foregroundColor),
            padding: MaterialStatePropertyAll<EdgeInsets?>(padding),
          ),
      child: child,
    );

    if (width != null || height != null) {
      res = SizedBox(
        width: width,
        height: height,
        child: res,
      );
    }

    return res;
  }
}
