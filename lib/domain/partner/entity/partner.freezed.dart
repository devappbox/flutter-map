// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'partner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return _Partner.fromJson(json);
}

/// @nodoc
mixin _$Partner {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  List<int> get services => throw _privateConstructorUsedError;
  String get openAt => throw _privateConstructorUsedError;
  String get closeAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerCopyWith<Partner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerCopyWith<$Res> {
  factory $PartnerCopyWith(Partner value, $Res Function(Partner) then) =
      _$PartnerCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String address,
      String phoneNumber,
      double latitude,
      double longitude,
      List<int> services,
      String openAt,
      String closeAt});
}

/// @nodoc
class _$PartnerCopyWithImpl<$Res> implements $PartnerCopyWith<$Res> {
  _$PartnerCopyWithImpl(this._value, this._then);

  final Partner _value;
  // ignore: unused_field
  final $Res Function(Partner) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? services = freezed,
    Object? openAt = freezed,
    Object? closeAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<int>,
      openAt: openAt == freezed
          ? _value.openAt
          : openAt // ignore: cast_nullable_to_non_nullable
              as String,
      closeAt: closeAt == freezed
          ? _value.closeAt
          : closeAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PartnerCopyWith<$Res> implements $PartnerCopyWith<$Res> {
  factory _$$_PartnerCopyWith(
          _$_Partner value, $Res Function(_$_Partner) then) =
      __$$_PartnerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String address,
      String phoneNumber,
      double latitude,
      double longitude,
      List<int> services,
      String openAt,
      String closeAt});
}

/// @nodoc
class __$$_PartnerCopyWithImpl<$Res> extends _$PartnerCopyWithImpl<$Res>
    implements _$$_PartnerCopyWith<$Res> {
  __$$_PartnerCopyWithImpl(_$_Partner _value, $Res Function(_$_Partner) _then)
      : super(_value, (v) => _then(v as _$_Partner));

  @override
  _$_Partner get _value => super._value as _$_Partner;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? services = freezed,
    Object? openAt = freezed,
    Object? closeAt = freezed,
  }) {
    return _then(_$_Partner(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      services: services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<int>,
      openAt: openAt == freezed
          ? _value.openAt
          : openAt // ignore: cast_nullable_to_non_nullable
              as String,
      closeAt: closeAt == freezed
          ? _value.closeAt
          : closeAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Partner extends _Partner {
  const _$_Partner(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.latitude,
      required this.longitude,
      required final List<int> services,
      required this.openAt,
      required this.closeAt})
      : _services = services,
        super._();

  factory _$_Partner.fromJson(Map<String, dynamic> json) =>
      _$$_PartnerFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<int> _services;
  @override
  List<int> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final String openAt;
  @override
  final String closeAt;

  @override
  String toString() {
    return 'Partner(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, latitude: $latitude, longitude: $longitude, services: $services, openAt: $openAt, closeAt: $closeAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Partner &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other.openAt, openAt) &&
            const DeepCollectionEquality().equals(other.closeAt, closeAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(openAt),
      const DeepCollectionEquality().hash(closeAt));

  @JsonKey(ignore: true)
  @override
  _$$_PartnerCopyWith<_$_Partner> get copyWith =>
      __$$_PartnerCopyWithImpl<_$_Partner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartnerToJson(
      this,
    );
  }
}

abstract class _Partner extends Partner {
  const factory _Partner(
      {required final String id,
      required final String name,
      required final String address,
      required final String phoneNumber,
      required final double latitude,
      required final double longitude,
      required final List<int> services,
      required final String openAt,
      required final String closeAt}) = _$_Partner;
  const _Partner._() : super._();

  factory _Partner.fromJson(Map<String, dynamic> json) = _$_Partner.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get phoneNumber;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  List<int> get services;
  @override
  String get openAt;
  @override
  String get closeAt;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerCopyWith<_$_Partner> get copyWith =>
      throw _privateConstructorUsedError;
}
