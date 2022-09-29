// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DtoPartner _$$_DtoPartnerFromJson(Map<String, dynamic> json) =>
    _$_DtoPartner(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      services:
          (json['services'] as List<dynamic>).map((e) => e as int).toList(),
      openAt: json['openAt'] as String,
      closeAt: json['closeAt'] as String,
    );

Map<String, dynamic> _$$_DtoPartnerToJson(_$_DtoPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'services': instance.services,
      'openAt': instance.openAt,
      'closeAt': instance.closeAt,
    };
