// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_request_creation_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChargeRequestCreationState {
  StateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<DeviceEntity> get devices => throw _privateConstructorUsedError;
  ChargeRequestCreationDTO? get chargeRequestCreationDTO =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChargeRequestCreationStateCopyWith<ChargeRequestCreationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeRequestCreationStateCopyWith<$Res> {
  factory $ChargeRequestCreationStateCopyWith(ChargeRequestCreationState value,
          $Res Function(ChargeRequestCreationState) then) =
      _$ChargeRequestCreationStateCopyWithImpl<$Res,
          ChargeRequestCreationState>;
  @useResult
  $Res call(
      {StateStatus status,
      String? error,
      List<DeviceEntity> devices,
      ChargeRequestCreationDTO? chargeRequestCreationDTO});
}

/// @nodoc
class _$ChargeRequestCreationStateCopyWithImpl<$Res,
        $Val extends ChargeRequestCreationState>
    implements $ChargeRequestCreationStateCopyWith<$Res> {
  _$ChargeRequestCreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? devices = null,
    Object? chargeRequestCreationDTO = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>,
      chargeRequestCreationDTO: freezed == chargeRequestCreationDTO
          ? _value.chargeRequestCreationDTO
          : chargeRequestCreationDTO // ignore: cast_nullable_to_non_nullable
              as ChargeRequestCreationDTO?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargeRequestCreationStateCopyWith<$Res>
    implements $ChargeRequestCreationStateCopyWith<$Res> {
  factory _$$_ChargeRequestCreationStateCopyWith(
          _$_ChargeRequestCreationState value,
          $Res Function(_$_ChargeRequestCreationState) then) =
      __$$_ChargeRequestCreationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus status,
      String? error,
      List<DeviceEntity> devices,
      ChargeRequestCreationDTO? chargeRequestCreationDTO});
}

/// @nodoc
class __$$_ChargeRequestCreationStateCopyWithImpl<$Res>
    extends _$ChargeRequestCreationStateCopyWithImpl<$Res,
        _$_ChargeRequestCreationState>
    implements _$$_ChargeRequestCreationStateCopyWith<$Res> {
  __$$_ChargeRequestCreationStateCopyWithImpl(
      _$_ChargeRequestCreationState _value,
      $Res Function(_$_ChargeRequestCreationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? devices = null,
    Object? chargeRequestCreationDTO = freezed,
  }) {
    return _then(_$_ChargeRequestCreationState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>,
      chargeRequestCreationDTO: freezed == chargeRequestCreationDTO
          ? _value.chargeRequestCreationDTO
          : chargeRequestCreationDTO // ignore: cast_nullable_to_non_nullable
              as ChargeRequestCreationDTO?,
    ));
  }
}

/// @nodoc

class _$_ChargeRequestCreationState extends _ChargeRequestCreationState {
  _$_ChargeRequestCreationState(
      {this.status = StateStatus.initial,
      this.error = "",
      final List<DeviceEntity> devices = const [],
      this.chargeRequestCreationDTO = null})
      : _devices = devices,
        super._();

  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final String? error;
  final List<DeviceEntity> _devices;
  @override
  @JsonKey()
  List<DeviceEntity> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  @JsonKey()
  final ChargeRequestCreationDTO? chargeRequestCreationDTO;

  @override
  String toString() {
    return 'ChargeRequestCreationState(status: $status, error: $error, devices: $devices, chargeRequestCreationDTO: $chargeRequestCreationDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargeRequestCreationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(
                    other.chargeRequestCreationDTO, chargeRequestCreationDTO) ||
                other.chargeRequestCreationDTO == chargeRequestCreationDTO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_devices), chargeRequestCreationDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargeRequestCreationStateCopyWith<_$_ChargeRequestCreationState>
      get copyWith => __$$_ChargeRequestCreationStateCopyWithImpl<
          _$_ChargeRequestCreationState>(this, _$identity);
}

abstract class _ChargeRequestCreationState extends ChargeRequestCreationState {
  factory _ChargeRequestCreationState(
          {final StateStatus status,
          final String? error,
          final List<DeviceEntity> devices,
          final ChargeRequestCreationDTO? chargeRequestCreationDTO}) =
      _$_ChargeRequestCreationState;
  _ChargeRequestCreationState._() : super._();

  @override
  StateStatus get status;
  @override
  String? get error;
  @override
  List<DeviceEntity> get devices;
  @override
  ChargeRequestCreationDTO? get chargeRequestCreationDTO;
  @override
  @JsonKey(ignore: true)
  _$$_ChargeRequestCreationStateCopyWith<_$_ChargeRequestCreationState>
      get copyWith => throw _privateConstructorUsedError;
}
