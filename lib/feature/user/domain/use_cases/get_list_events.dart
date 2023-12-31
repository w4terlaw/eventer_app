import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '/core/error/failure.dart';
import '/core/usecases/usecase.dart';
import '../../data/models/event/event.dart';
import '../repositories/events_repository.dart';

class GetListEvents extends UseCase<List<Event>, PageEventParams> {
  final EventsRepository eventsRepositoryInterface;

  GetListEvents(this.eventsRepositoryInterface);

  @override
  Future<Either<Failure, List<Event>>> call(PageEventParams params) async {
    return await eventsRepositoryInterface.getListEvents(
        params.page, params.name);
  }
}

class PageEventParams extends Equatable {
  final int page;
  final String name;

  const PageEventParams({
    required this.page,
    required this.name,
  });

  @override
  List<Object?> get props => [page, name];
}
