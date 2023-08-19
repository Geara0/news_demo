import 'package:flutter/widgets.dart';

class EventDto {
  String header;
  String? role;
  String date;
  String place;
  // По-идее тут должны быть байты, но за отсутствием ответа с сервера будет так
  ImageProvider image;

  EventDto({
    required this.header,
    required this.role,
    required this.date,
    required this.place,
    required this.image,
  });
}
