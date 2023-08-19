import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';
import 'package:news_demo/widgets/colored_button/colored_button.dart';

const _defaultTextColor = Colors.white;

class EventCard extends StatelessWidget {
  final String? date;
  final String? title;
  final String? place;
  final double? width;
  final double? height;
  final Color? textColor;
  final ImageProvider background;
  final ImageProvider? icon;

  const EventCard({
    super.key,
    this.width,
    this.height,
    this.date,
    this.title,
    this.place,
    this.textColor,
    required this.background,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: background,
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ColoredButton(
                width: 48,
                height: 48,
                onPressed: () {},
                backgroundColor: Colors.white30,
                padding: EdgeInsets.zero,
                child: const SizedBox(
                  child: Icon(Icomoon.share),
                ),
              ),
            ),
            const Spacer(),
            if (icon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 88,
                  child: Image(
                    image: icon!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            if (date != null) ...[
              SizedBox(height: 16),
              Text(
                date!,
                style: TextStyle(
                  color: textColor ?? _defaultTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
            if (title != null) ...[
              const SizedBox(height: 8),
              Text(
                title!,
                style: TextStyle(
                  color: textColor ?? _defaultTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
            if (place != null) ...[
              const SizedBox(height: 12),
              Text(
                place!,
                style: TextStyle(
                  color: textColor ?? _defaultTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
