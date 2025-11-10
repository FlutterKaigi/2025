import 'package:bff_client/bff_client.dart' as bff;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue.freezed.dart';
part 'venue.g.dart';

@freezed
abstract class Venue with _$Venue {
  const factory Venue({
    required String id,
    required String name,
  }) = _Venue;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

extension VenueExtension on bff.Venue {
  Venue toVenue() => Venue(
    id: id,
    name: name,
  );
}
