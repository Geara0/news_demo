part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsReceiveState extends NewsState {
  final List<NewsDto> news;

  NewsReceiveState(this.news);
}
