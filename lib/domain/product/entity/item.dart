import 'package:flutter_map/domain/core/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item implements IEntity {
  const Item._();
  const factory Item({
    required String id,
    required String qty,
    required String price,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
