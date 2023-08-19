import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_demo/blocs/news_bloc/dto/news_type.dart';
import 'package:news_demo/blocs/news_bloc/news_bloc.dart';
import 'package:news_demo/router/router.dart';
import 'package:news_demo/widgets/news_card/news_card.dart';

@RoutePage()
class NewsPage extends StatelessWidget implements AutoRouteWrapper {
  const NewsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _NewsPage();
  }
}

class _NewsPage extends StatefulWidget {
  @override
  State<_NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<_NewsPage> {
  var _selected = 0;
  late final _chips = [
    (NewsType.any, 'newsPage.chips.all'.tr()),
    (NewsType.trends, 'newsPage.chips.trends'.tr()),
    (NewsType.global, 'newsPage.chips.industries'.tr()),
    (NewsType.none, 'newsPage.chips.russian'.tr()),
    (NewsType.none, 'newsPage.chips.finance'.tr()),
    (NewsType.none, 'newsPage.chips.futureTech'.tr()),
    (NewsType.none, 'newsPage.chips.regions'.tr()),
    (NewsType.none, 'newsPage.chips.nationalProjects'.tr()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _chips.length + 2,
            itemBuilder: (context, i) {
              if (i == 0 || i == _chips.length + 1) {
                return const SizedBox(width: 26);
              }
              i--;

              var (type, text) = _chips[i];
              return ChoiceChip(
                label: Text(text),
                selected: _selected == i,
                onSelected: (_) {
                  context.read<NewsBloc>().add(NewsRequestEvent(type));
                  setState(() => _selected = i);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsInitialState) {
                  context.read<NewsBloc>().add(NewsInitialEvent());
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is NewsReceiveState) {
                  if (state.news.isEmpty) {
                    return Center(
                      child: const Text('newsPage.noNews').tr(),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, i) {
                      final e = state.news[i];

                      return NewsCard(
                        header: e.header,
                        date: e.date,
                        image: e.image,
                        timeAgo: e.timeAgo,
                        onTap: () => context.router.push(
                          NewsModalRoute(
                            header: e.header,
                            text: e.text,
                            date: e.date,
                            image: e.image,
                            timeAgo: e.timeAgo,
                          ),
                        ),
                      );
                    },
                  );
                }

                throw Exception('Unknown state');
              },
            ),
          ),
        ),
      ],
    );
  }
}
