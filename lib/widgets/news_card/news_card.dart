import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String header;
  final String date;
  final ImageProvider image;
  final String? timeAgo;
  final VoidCallback? onTap;
  final double? heroTag;

  const NewsCard({
    super.key,
    required this.header,
    required this.date,
    required this.image,
    this.timeAgo,
    this.heroTag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var bottomText = date;
    if (timeAgo != null) {
      bottomText += ' \u2022 $timeAgo';
    }

    Widget img = Container(
      width: 96,
      height: 96,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image(
        image: image,
        fit: BoxFit.cover,
      ),
    );

    if (heroTag != null) {
      img = Hero(tag: heroTag!, child: img);
    }

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        bottomText,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 19),
                img,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
