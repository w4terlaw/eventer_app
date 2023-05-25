part of 'event.dart';

@freezed
class Venues with _$Venues {
  const factory Venues({
    required String name,
    required List<String> photos,
  }) = _Venues;

  factory Venues.fromJson(Map<String, dynamic> json) => _$VenuesFromJson(json);
}