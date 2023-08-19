part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class EventsInitialState extends EventsState {}

class EventsLoadedState extends EventsState {
  final List<EventDto> events;

  EventsLoadedState(this.events);
}
