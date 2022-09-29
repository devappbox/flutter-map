// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_data_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PartnerDataState _$$_PartnerDataStateFromJson(Map<String, dynamic> json) =>
    _$_PartnerDataState(
      partners: (json['partners'] as List<dynamic>?)
          ?.map((e) => Partner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PartnerDataStateToJson(_$_PartnerDataState instance) =>
    <String, dynamic>{
      'partners': instance.partners,
    };
