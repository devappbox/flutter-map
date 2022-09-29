// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartState _$$_CartStateFromJson(Map<String, dynamic> json) => _$_CartState(
      idItem: json['idItem'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CartStateToJson(_$_CartState instance) =>
    <String, dynamic>{
      'idItem': instance.idItem,
      'items': instance.items,
    };
