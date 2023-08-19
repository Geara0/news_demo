part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsInitialEvent extends NewsEvent {}

class NewsRequestEvent extends NewsEvent {
  final NewsType type;

  NewsRequestEvent(this.type);
}
