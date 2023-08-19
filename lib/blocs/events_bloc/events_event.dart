part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class EventsInitialEvent extends EventsEvent {
  final EventType type;
  EventsInitialEvent(this.type);
}
