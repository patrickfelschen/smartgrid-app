// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_profile_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceProfileState {
  List<DeviceEntity>? get devices => throw _privateConstructorUsedError;
  DeviceEntity? get selectedDevice => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceProfileStateCopyWith<DeviceProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceProfileStateCopyWith<$Res> {
  factory $DeviceProfileStateCopyWith(
          DeviceProfileState value, $Res Function(DeviceProfileState) then) =
      _$DeviceProfileStateCopyWithImpl<$Res, DeviceProfileState>;
  @useResult
  $Res call(
      {List<DeviceEntity>? devices,
      DeviceEntity? selectedDevice,
      StateStatus status,
      String? error});
}

/// @nodoc
class _$DeviceProfileStateCopyWithImpl<$Res, $Val extends DeviceProfileState>
    implements $DeviceProfileStateCopyWith<$Res> {
  _$DeviceProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = freezed,
    Object? selectedDevice = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>?,
      selectedDevice: freezed == selectedDevice
          ? _value.selectedDevice
          : selectedDevice // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceProfileStateCopyWith<$Res>
    implements $DeviceProfileStateCopyWith<$Res> {
  factory _$$_DeviceProfileStateCopyWith(_$_DeviceProfileState value,
          $Res Function(_$_DeviceProfileState) then) =
      __$$_DeviceProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DeviceEntity>? devices,
      DeviceEntity? selectedDevice,
      StateStatus status,
      String? error});
}

/// @nodoc
class __$$_DeviceProfileStateCopyWithImpl<$Res>
    extends _$DeviceProfileStateCopyWithImpl<$Res, _$_DeviceProfileState>
    implements _$$_DeviceProfileStateCopyWith<$Res> {
  __$$_DeviceProfileStateCopyWithImpl(
      _$_DeviceProfileState _value, $Res Function(_$_DeviceProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = freezed,
    Object? selectedDevice = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_DeviceProfileState(
      devices: freezed == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>?,
      selectedDevice: freezed == selectedDevice
          ? _value.selectedDevice
          : selectedDevice // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DeviceProfileState implements _DeviceProfileState {
  const _$_DeviceProfileState(
      {final List<DeviceEntity>? devices = null,
      this.selectedDevice = null,
      this.status = StateStatus.initial,
      this.error = null})
      : _devices = devices;

  final List<DeviceEntity>? _devices;
  @override
  @JsonKey()
  List<DeviceEntity>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final DeviceEntity? selectedDevice;
  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'DeviceProfileState(devices: $devices, selectedDevice: $selectedDevice, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceProfileState &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.selectedDevice, selectedDevice) ||
                other.selectedDevice == selectedDevice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_devices),
      selectedDevice,
      status,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceProfileStateCopyWith<_$_DeviceProfileState> get copyWith =>
      __$$_DeviceProfileStateCopyWithImpl<_$_DeviceProfileState>(
          this, _$identity);
}

abstract class _DeviceProfileState implements DeviceProfileState {
  const factory _DeviceProfileState(
      {final List<DeviceEntity>? devices,
      final DeviceEntity? selectedDevice,
      final StateStatus status,
      final String? error}) = _$_DeviceProfileState;

  @override
  List<DeviceEntity>? get devices;
  @override
  DeviceEntity? get selectedDevice;
  @override
  StateStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceProfileStateCopyWith<_$_DeviceProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
