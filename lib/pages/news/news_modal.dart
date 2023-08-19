import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';

@RoutePage()
class NewsModal extends StatelessWidget {
  final String header;
  final String text;
  final String date;
  final ImageProvider image;
  final String? timeAgo;
  final double? heroTag;

  const NewsModal({
    super.key,
    required this.header,
    required this.text,
    required this.date,
    required this.image,
    this.timeAgo,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    var bottomText = date;
    if (timeAgo != null) {
      bottomText += ' \u2022 $timeAgo';
    }

    Widget img = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image(
        width: double.infinity,
        height: 168,
        image: image,
        fit: BoxFit.cover,
      ),
    );

    if (heroTag != null) {
      img = Hero(tag: heroTag!, child: img);
    }

    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            GestureDetector(
              onTap: context.router.pop,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 4,
                width: 32,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'newsModal.header'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton.filledTonal(
                              onPressed: context.router.pop,
                              icon: const Icon(Icomoon.cross),
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Colors.black,
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Color(0xFFF2F3F7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 36),
                            img,
                            const SizedBox(height: 16),
                            Text(
                              header,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                height: 1.4,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              bottomText,
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              text,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                height: 1.5,
                                color: Color(0xFF778A9B),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.paddingOf(context).bottom,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
