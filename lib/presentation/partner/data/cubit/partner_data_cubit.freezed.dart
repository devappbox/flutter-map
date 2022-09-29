// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'partner_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartnerDataState _$PartnerDataStateFromJson(Map<String, dynamic> json) {
  return _PartnerDataState.fromJson(json);
}

/// @nodoc
mixin _$PartnerDataState {
  List<Partner>? get partners => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerDataStateCopyWith<PartnerDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerDataStateCopyWith<$Res> {
  factory $PartnerDataStateCopyWith(
          PartnerDataState value, $Res Function(PartnerDataState) then) =
      _$PartnerDataStateCopyWithImpl<$Res>;
  $Res call({List<Partner>? partners});
}

/// @nodoc
class _$PartnerDataStateCopyWithImpl<$Res>
    implements $PartnerDataStateCopyWith<$Res> {
  _$PartnerDataStateCopyWithImpl(this._value, this._then);

  final PartnerDataState _value;
  // ignore: unused_field
  final $Res Function(PartnerDataState) _then;

  @override
  $Res call({
    Object? partners = freezed,
  }) {
    return _then(_value.copyWith(
      partners: partners == freezed
          ? _value.partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<Partner>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PartnerDataStateCopyWith<$Res>
    implements $PartnerDataStateCopyWith<$Res> {
  factory _$$_PartnerDataStateCopyWith(
          _$_PartnerDataState value, $Res Function(_$_PartnerDataState) then) =
      __$$_PartnerDataStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Partner>? partners});
}

/// @nodoc
class __$$_PartnerDataStateCopyWithImpl<$Res>
    extends _$PartnerDataStateCopyWithImpl<$Res>
    implements _$$_PartnerDataStateCopyWith<$Res> {
  __$$_PartnerDataStateCopyWithImpl(
      _$_PartnerDataState _value, $Res Function(_$_PartnerDataState) _then)
      : super(_value, (v) => _then(v as _$_PartnerDataState));

  @override
  _$_PartnerDataState get _value => super._value as _$_PartnerDataState;

  @override
  $Res call({
    Object? partners = freezed,
  }) {
    return _then(_$_PartnerDataState(
      partners: partners == freezed
          ? _value._partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<Partner>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PartnerDataState implements _PartnerDataState {
  const _$_PartnerDataState({required final List<Partner>? partners})
      : _partners = partners;

  factory _$_PartnerDataState.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerDataStateFromJson(json);

  final List<Partner>? _partners;
  @override
  List<Partner>? get partners {
    final value = _partners;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PartnerDataState(partners: $partners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PartnerDataState &&
            const DeepCollectionEquality().equals(other._partners, _partners));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_partners));

  @JsonKey(ignore: true)
  @override
  _$$_PartnerDataStateCopyWith<_$_PartnerDataState> get copyWith =>
      __$$_PartnerDataStateCopyWithImpl<_$_PartnerDataState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerDataStateToJson(
      this,
    );
  }
}

abstract class _PartnerDataState implements PartnerDataState {
  const factory _PartnerDataState({required final List<Partner>? partners}) =
      _$_PartnerDataState;

  factory _PartnerDataState.fromJson(Map<String, dynamic> json) =
      _$_PartnerDataState.fromJson;

  @override
  List<Partner>? get partners;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerDataStateCopyWith<_$_PartnerDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
