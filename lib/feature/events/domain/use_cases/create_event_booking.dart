import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/feature/events/data/models/booking/booking.dart';
import 'package:eventer_app/feature/events/domain/repositories/event_booking_repository.dart';

import '/core/error/failure.dart';
import '/core/usecases/usecase.dart';
import '../../data/models/event_dates_checkbox.dart';

class CreateEventBooking extends UseCase<Booking, EventBookingParams> {
  final EventBookingRepository eventBookingRepository;

  CreateEventBooking(this.eventBookingRepository);

  @override
  Future<Either<Failure, Booking>> call(EventBookingParams params) async {
    return await eventBookingRepository.createEventBooking(
        params.eventId, params.eventDates);
  }
}

class EventBookingParams extends Equatable {
  final int eventId;
  final EventDatesCheckbox eventDates;

  const EventBookingParams({required this.eventId, required this.eventDates});

  @override
  List<Object?> get props => [eventId, eventDates];
}
