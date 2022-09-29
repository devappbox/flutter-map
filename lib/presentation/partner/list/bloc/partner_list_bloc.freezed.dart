// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'partner_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PartnerListState {
  StateStatus<FailureExceptions, List<Partner>?> get status =>
      throw _privateConstructorUsedError;
  bool get isSearch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartnerListStateCopyWith<PartnerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerListStateCopyWith<$Res> {
  factory $PartnerListStateCopyWith(
          PartnerListState value, $Res Function(PartnerListState) then) =
      _$PartnerListStateCopyWithImpl<$Res>;
  $Res call(
      {StateStatus<FailureExceptions, List<Partner>?> status, bool isSearch});

  $StateStatusCopyWith<FailureExceptions, List<Partner>?, $Res> get status;
}

/// @nodoc
class _$PartnerListStateCopyWithImpl<$Res>
    implements $PartnerListStateCopyWith<$Res> {
  _$PartnerListStateCopyWithImpl(this._value, this._then);

  final PartnerListState _value;
  // ignore: unused_field
  final $Res Function(PartnerListState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? isSearch = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus<FailureExceptions, List<Partner>?>,
      isSearch: isSearch == freezed
          ? _value.isSearch
          : isSearch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $StateStatusCopyWith<FailureExceptions, List<Partner>?, $Res> get status {
    return $StateStatusCopyWith<FailureExceptions, List<Partner>?, $Res>(
        _value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$$_PartnerListStateCopyWith<$Res>
    implements $PartnerListStateCopyWith<$Res> {
  factory _$$_PartnerListStateCopyWith(
          _$_PartnerListState value, $Res Function(_$_PartnerListState) then) =
      __$$_PartnerListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StateStatus<FailureExceptions, List<Partner>?> status, bool isSearch});

  @override
  $StateStatusCopyWith<FailureExceptions, List<Partner>?, $Res> get status;
}

/// @nodoc
class __$$_PartnerListStateCopyWithImpl<$Res>
    extends _$PartnerListStateCopyWithImpl<$Res>
    implements _$$_PartnerListStateCopyWith<$Res> {
  __$$_PartnerListStateCopyWithImpl(
      _$_PartnerListState _value, $Res Function(_$_PartnerListState) _then)
      : super(_value, (v) => _then(v as _$_PartnerListState));

  @override
  _$_PartnerListState get _value => super._value as _$_PartnerListState;

  @override
  $Res call({
    Object? status = freezed,
    Object? isSearch = freezed,
  }) {
    return _then(_$_PartnerListState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus<FailureExceptions, List<Partner>?>,
      isSearch: isSearch == freezed
          ? _value.isSearch
          : isSearch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PartnerListState implements _PartnerListState {
  const _$_PartnerListState({required this.status, required this.isSearch});

  @override
  final StateStatus<FailureExceptions, List<Partner>?> status;
  @override
  final bool isSearch;

  @override
  String toString() {
    return 'PartnerListState(status: $status, isSearch: $isSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PartnerListState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.isSearch, isSearch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isSearch));

  @JsonKey(ignore: true)
  @override
  _$$_PartnerListStateCopyWith<_$_PartnerListState> get copyWith =>
      __$$_PartnerListStateCopyWithImpl<_$_PartnerListState>(this, _$identity);
}

abstract class _PartnerListState implements PartnerListState {
  const factory _PartnerListState(
      {required final StateStatus<FailureExceptions, List<Partner>?> status,
      required final bool isSearch}) = _$_PartnerListState;

  @override
  StateStatus<FailureExceptions, List<Partner>?> get status;
  @override
  bool get isSearch;
  @override
  @JsonKey(ignore: true)
  _$$_PartnerListStateCopyWith<_$_PartnerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PartnerListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) changed,
    required TResult Function(List<Partner>? partners) collect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangedKeyWordEvent value) changed,
    required TResult Function(CollectPartnerListEvent value) collect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerListEventCopyWith<$Res> {
  factory $PartnerListEventCopyWith(
          PartnerListEvent value, $Res Function(PartnerListEvent) then) =
      _$PartnerListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PartnerListEventCopyWithImpl<$Res>
    implements $PartnerListEventCopyWith<$Res> {
  _$PartnerListEventCopyWithImpl(this._value, this._then);

  final PartnerListEvent _value;
  // ignore: unused_field
  final $Res Function(PartnerListEvent) _then;
}

/// @nodoc
abstract class _$$ChangedKeyWordEventCopyWith<$Res> {
  factory _$$ChangedKeyWordEventCopyWith(_$ChangedKeyWordEvent value,
          $Res Function(_$ChangedKeyWordEvent) then) =
      __$$ChangedKeyWordEventCopyWithImpl<$Res>;
  $Res call({String keyWord});
}

/// @nodoc
class __$$ChangedKeyWordEventCopyWithImpl<$Res>
    extends _$PartnerListEventCopyWithImpl<$Res>
    implements _$$ChangedKeyWordEventCopyWith<$Res> {
  __$$ChangedKeyWordEventCopyWithImpl(
      _$ChangedKeyWordEvent _value, $Res Function(_$ChangedKeyWordEvent) _then)
      : super(_value, (v) => _then(v as _$ChangedKeyWordEvent));

  @override
  _$ChangedKeyWordEvent get _value => super._value as _$ChangedKeyWordEvent;

  @override
  $Res call({
    Object? keyWord = freezed,
  }) {
    return _then(_$ChangedKeyWordEvent(
      keyWord: keyWord == freezed
          ? _value.keyWord
          : keyWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangedKeyWordEvent implements ChangedKeyWordEvent {
  const _$ChangedKeyWordEvent({required this.keyWord});

  @override
  final String keyWord;

  @override
  String toString() {
    return 'PartnerListEvent.changed(keyWord: $keyWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangedKeyWordEvent &&
            const DeepCollectionEquality().equals(other.keyWord, keyWord));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyWord));

  @JsonKey(ignore: true)
  @override
  _$$ChangedKeyWordEventCopyWith<_$ChangedKeyWordEvent> get copyWith =>
      __$$ChangedKeyWordEventCopyWithImpl<_$ChangedKeyWordEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) changed,
    required TResult Function(List<Partner>? partners) collect,
  }) {
    return changed(keyWord);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
  }) {
    return changed?.call(keyWord);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(keyWord);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangedKeyWordEvent value) changed,
    required TResult Function(CollectPartnerListEvent value) collect,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class ChangedKeyWordEvent implements PartnerListEvent {
  const factory ChangedKeyWordEvent({required final String keyWord}) =
      _$ChangedKeyWordEvent;

  String get keyWord;
  @JsonKey(ignore: true)
  _$$ChangedKeyWordEventCopyWith<_$ChangedKeyWordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectPartnerListEventCopyWith<$Res> {
  factory _$$CollectPartnerListEventCopyWith(_$CollectPartnerListEvent value,
          $Res Function(_$CollectPartnerListEvent) then) =
      __$$CollectPartnerListEventCopyWithImpl<$Res>;
  $Res call({List<Partner>? partners});
}

/// @nodoc
class __$$CollectPartnerListEventCopyWithImpl<$Res>
    extends _$PartnerListEventCopyWithImpl<$Res>
    implements _$$CollectPartnerListEventCopyWith<$Res> {
  __$$CollectPartnerListEventCopyWithImpl(_$CollectPartnerListEvent _value,
      $Res Function(_$CollectPartnerListEvent) _then)
      : super(_value, (v) => _then(v as _$CollectPartnerListEvent));

  @override
  _$CollectPartnerListEvent get _value =>
      super._value as _$CollectPartnerListEvent;

  @override
  $Res call({
    Object? partners = freezed,
  }) {
    return _then(_$CollectPartnerListEvent(
      partners: partners == freezed
          ? _value._partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<Partner>?,
    ));
  }
}

/// @nodoc

class _$CollectPartnerListEvent implements CollectPartnerListEvent {
  const _$CollectPartnerListEvent({required final List<Partner>? partners})
      : _partners = partners;

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
    return 'PartnerListEvent.collect(partners: $partners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectPartnerListEvent &&
            const DeepCollectionEquality().equals(other._partners, _partners));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_partners));

  @JsonKey(ignore: true)
  @override
  _$$CollectPartnerListEventCopyWith<_$CollectPartnerListEvent> get copyWith =>
      __$$CollectPartnerListEventCopyWithImpl<_$CollectPartnerListEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyWord) changed,
    required TResult Function(List<Partner>? partners) collect,
  }) {
    return collect(partners);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
  }) {
    return collect?.call(partners);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyWord)? changed,
    TResult Function(List<Partner>? partners)? collect,
    required TResult orElse(),
  }) {
    if (collect != null) {
      return collect(partners);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangedKeyWordEvent value) changed,
    required TResult Function(CollectPartnerListEvent value) collect,
  }) {
    return collect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
  }) {
    return collect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangedKeyWordEvent value)? changed,
    TResult Function(CollectPartnerListEvent value)? collect,
    required TResult orElse(),
  }) {
    if (collect != null) {
      return collect(this);
    }
    return orElse();
  }
}

abstract class CollectPartnerListEvent implements PartnerListEvent {
  const factory CollectPartnerListEvent(
      {required final List<Partner>? partners}) = _$CollectPartnerListEvent;

  List<Partner>? get partners;
  @JsonKey(ignore: true)
  _$$CollectPartnerListEventCopyWith<_$CollectPartnerListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
