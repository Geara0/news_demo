import 'package:flutter/widgets.dart';

class NewsDto {
  String header;
  String text;
  ImageProvider image;
  String date;
  String? timeAgo;

  NewsDto({
    required this.header,
    required this.text,
    required this.image,
    required this.date,
    this.timeAgo,
  });
}
