import 'package:flutter/foundation.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:flutter_map/domain/product/entity/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';
part 'cart_cubit.g.dart';

class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartState.initial());

  void onIncrement(String idItem) {
    //emit(state.copyWith(id: partners));
  }

  @override
  CartState fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CartState state) {
    return state.toJson();
  }
}
