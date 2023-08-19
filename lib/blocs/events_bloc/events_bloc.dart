import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_demo/blocs/events_bloc/dto/event_dto.dart';

import 'dto/event_type.dart';

part 'events_event.dart';

part 'events_state.dart';

final activeEvents = List.generate(
  3,
  (_) => EventDto(
    header: 'Петербургский международный юридический форум 2023',
    role: '',
    date: '11–13 мая | Экспофорум',
    place: 'Санкт-Петербург, Россия',
    image: const AssetImage('assets/card/background.png'),
  ),
);

final userEvents = [
  EventDto(
    header: 'Петербургский международный экономический форум',
    role: 'роль: дирекция и тех персонал',
    date: '18 - 23 фев',
    image: const AssetImage('assets/user_event/img.png'),
    place: 'Санкт-Петербург, Россия',
  ),
  EventDto(
    header: 'Восточный экономический форум',
    role: 'роль: дирекция и тех персонал',
    date: '18 - 23 фев',
    image: const AssetImage('assets/user_event/img.png'),
    place: 'Санкт-Петербург, Россия',
  ),
];
final archivedEvents = [
  EventDto(
    header: 'Петербургский юридический форум',
    role: 'роль: дирекция и тех персонал',
    date: '18 - 23 фев',
    image: const AssetImage('assets/user_event/img.png'),
    place: 'Санкт-Петербург, Россия',
  ),
];

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitialState()) {
    on<EventsInitialEvent>(_initialEvent);
  }

  FutureOr<void> _initialEvent(EventsInitialEvent event, emit) async {
    // Эмуляция сервера
    await Future.delayed(const Duration(milliseconds: 500));
    late final List<EventDto> res;

    switch (event.type) {
      case EventType.active:
        res = activeEvents;
        break;
      case EventType.user:
        res = userEvents;
        break;
      case EventType.archive:
        res = archivedEvents;
        break;
    }

    emit(EventsLoadedState(res));
  }
}
