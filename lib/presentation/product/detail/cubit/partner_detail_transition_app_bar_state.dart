part of 'partner_detail_transition_app_bar_cubit.dart';

@freezed
class PartnerDetailTransititonAppBarState
    with _$PartnerDetailTransititonAppBarState {
  const factory PartnerDetailTransititonAppBarState({
    required bool builder,
    required bool builder1,
    required bool builder2,
    required double? heightImage,
    required double? heightStatusBar,
    required double? heightAppBar,
    required double? heightIconBackArrow,
  }) = _PartnerDetailTransititonAppBarState;

  factory PartnerDetailTransititonAppBarState.initial() =>
      const PartnerDetailTransititonAppBarState(
          builder: false,
          builder1: false,
          builder2: false,
          heightImage: null,
          heightAppBar: null,
          heightStatusBar: null,
          heightIconBackArrow: null);
}
