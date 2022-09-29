part of 'partner_data_cubit.dart';

// @freezed
// class PartnerDataState with _$PartnerDataState {
//   const factory PartnerDataState({required Auth? auth}) = _PartnerDataState;

//   factory PartnerDataState.initial() => PartnerDataState(auth: null);
// }

@freezed
class PartnerDataState with _$PartnerDataState {
  const factory PartnerDataState({required List<Partner>? partners}) =
      _PartnerDataState;

  factory PartnerDataState.initial() => const PartnerDataState(partners: null);
  factory PartnerDataState.reLoad(List<Partner>? partners) => PartnerDataState(
        partners: partners,
      );

  factory PartnerDataState.fromJson(Map<String, dynamic> json) =>
      _$PartnerDataStateFromJson(json);
}
