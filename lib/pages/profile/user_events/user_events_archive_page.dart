import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_demo/blocs/events_bloc/dto/event_type.dart';
import 'package:news_demo/blocs/events_bloc/events_bloc.dart';
import 'package:news_demo/widgets/secondary_app_bar/secondary_app_bar.dart';
import 'package:news_demo/widgets/user_event_card/user_event_card.dart';

@RoutePage()
class UserEventsArchivePage extends StatelessWidget with AutoRouteWrapper {
  const UserEventsArchivePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        header: 'userEventsArchivePage.header'.tr(),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('userEventsArchivePage.clear').tr(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is EventsInitialState) {
              context
                  .read<EventsBloc>()
                  .add(EventsInitialEvent(EventType.archive));
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EventsLoadedState) {
              if (state.events.isEmpty) {
                return Center(child: const Text('eventsPage.noEvents').tr());
              }

              return ListView.builder(
                itemCount: state.events.length,
                itemBuilder: (BuildContext context, int i) {
                  final e = state.events[i];
                  return UserEventCard(
                    image: e.image,
                    title: e.header,
                    role: e.role ?? '',
                    date: e.date,
                  );
                },
              );
            }

            throw Exception('Unknown state');
          },
        ),
      ),
    );
  }
}
