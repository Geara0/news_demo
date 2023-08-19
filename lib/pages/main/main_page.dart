import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_demo/blocs/events_bloc/dto/event_type.dart';
import 'package:news_demo/blocs/events_bloc/events_bloc.dart';
import 'package:news_demo/widgets/event_card/event_card.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator.dart';
import 'package:news_demo/widgets/page_indicator/page_indicator_style.dart';

@RoutePage()
class MainPage extends StatelessWidget with AutoRouteWrapper {
  const MainPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _MainPage();
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage({super.key});

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  final _cardController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        Theme.of(context).extension<PageIndicatorStyle>()!.copyWith(
              activeDotColor: const Color(0xFF212122),
            ),
      ],
    );
    return Theme(
      data: themeData,
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is EventsInitialState) {
            context
                .read<EventsBloc>()
                .add(EventsInitialEvent(EventType.active));
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EventsLoadedState) {
            if (state.events.isEmpty) {
              return Center(child: const Text('mainPage.noEvents').tr());
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _cardController,
                    itemCount: state.events.length,
                    itemBuilder: (context, i) {
                      final e = state.events[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: EventCard(
                          date: e.date,
                          title: e.header,
                          place: e.place,
                          // background: const AssetImage('assets/card/background.png'),
                          background: e.image,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                PageIndicator(
                  controller: _cardController,
                  count: state.events.length,
                ),
              ],
            );
          }

          throw Exception('Unknown state');
        },
      ),
    );
  }
}
