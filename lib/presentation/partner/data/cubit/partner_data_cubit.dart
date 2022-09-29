import 'package:flutter/foundation.dart';
import 'package:flutter_map/domain/partner/entity/partner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'partner_data_state.dart';
part 'partner_data_cubit.freezed.dart';
part 'partner_data_cubit.g.dart';

class PartnerDataCubit extends HydratedCubit<PartnerDataState> {
  PartnerDataCubit() : super(PartnerDataState.initial());

  void onPartnerDataReload(List<Partner>? partners) {
    emit(state.copyWith(partners: partners));
  }

  @override
  PartnerDataState fromJson(Map<String, dynamic> json) {
    return PartnerDataState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PartnerDataState state) {
    return state.toJson();
  }
}
