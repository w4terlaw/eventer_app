import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eventer_app/data/get_list_events/models/event.dart';
import 'package:eventer_app/data/get_list_events/usecases/get_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_event_bloc.freezed.dart';

part 'get_event_event.dart';

part 'get_event_state.dart';

class GetEventBloc extends Bloc<GetEventEvent, GetEventState> {
  final GetEvent getEventUsecase;

  GetEventBloc({required this.getEventUsecase})
      : super(const GetEventState.loading()) {
    on<_GetEventById>(_getEventById);
  }

  FutureOr<void> _getEventById(
      _GetEventById event, Emitter<GetEventState> emit) async {
    final eventOrFailure = await getEventUsecase(PageEventParams(id: event.id));
    eventOrFailure.fold(
      (error) => emit(GetEventError(error: error.toString())),
      (event) => emit(GetEventLoaded(event: event)),
    );
  }
}