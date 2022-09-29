part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {required String? idItem, required List<Item>? items}) = _CartState;

  factory CartState.initial() => const CartState(idItem: null, items: null);

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
}
