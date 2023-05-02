import 'dart:async';

import 'package:eventer_app/core/error/failure.dart';
import 'package:eventer_app/data/get_list_events/models/event.dart';
import 'package:eventer_app/data/get_list_events/usecases/get_list_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';


part 'get_list_events_event.dart';

part 'get_list_events_state.dart';

part 'get_list_events_bloc.freezed.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetListEvents getEventsUsecase;

  EventsBloc({
    required this.getEventsUsecase,
  }) : super(const EventsState.loading()) {
    on<_EventsEventFetch>(_eventsFetch);
    // _init();
  }

  // void _init() {
  //   add(const EventsEvent.fetch(page: 1, name: ''));
  // }

  FutureOr<void> _eventsFetch(
      _EventsEventFetch event, Emitter<EventsState> emit) async {
    emit(const EventsState.loading());

    final failureOrEvents = await getEventsUsecase(
        PageEventParams(page: event.page, name: event.name));
    failureOrEvents.fold(
      (failure) {
        emit(EventsState.error(message: _mapFailure(failure)));
      },
      (events) {
        emit(EventsState.loaded(events: events));
      },
    );
  }

  String _mapFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Не удалось подключиться к серверу';
      case SocketFailure:
        return 'Не удалось подключиться к серверу /socket';
      case UnauthorizedFailure:
        return 'Token has been expired';
      default:
        return 'Unexpected Error';
    }
  }
}