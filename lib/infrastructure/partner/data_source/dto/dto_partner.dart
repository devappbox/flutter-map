import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_partner.freezed.dart';
part 'dto_partner.g.dart';

@freezed
class DtoPartner with _$DtoPartner {
  const DtoPartner._();
  const factory DtoPartner({
    required String id,
    required String name,
    required String address,
    required String phoneNumber,
    required double latitude,
    required double longitude,
    required List<int> services,
    required String openAt,
    required String closeAt,
  }) = _DtoPartner;

  factory DtoPartner.fromPartnerFakeData(Map<String, dynamic> partnerJson) =>
      DtoPartner(
          id: partnerJson["id"],
          name: partnerJson["name"],
          address: partnerJson["address"],
          phoneNumber: partnerJson["phoneNumber"],
          latitude: partnerJson["latitude"],
          longitude: partnerJson["longitude"],
          services: partnerJson["services"],
          openAt: partnerJson["openAt"],
          closeAt: partnerJson["closeAt"]);

  factory DtoPartner.fromJson(Map<String, dynamic> json) =>
      _$DtoPartnerFromJson(json);
}

extension DtoPartnerX on DtoPartner {
  Partner toDomain() {
    return Partner(
        id: id,
        name: name,
        address: address,
        phoneNumber: phoneNumber,
        latitude: latitude,
        longitude: longitude,
        services: services,
        openAt: openAt,
        closeAt: closeAt);
  }
}
