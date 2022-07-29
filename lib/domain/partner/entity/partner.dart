import 'package:flutter_map/domain/partner/core/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner.freezed.dart';
part 'partner.g.dart';

@freezed
class Partner with _$Partner implements IEntity {
  const Partner._();
  const factory Partner({
    required String id,
    required String name,
    required String address,
    required String phoneNumber,
    required double latitude,
    required double longitude,
    required List<int> services,
  }) = _Partner;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}
