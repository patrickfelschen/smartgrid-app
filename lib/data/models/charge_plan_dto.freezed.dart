// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_plan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChargePlanDTO _$ChargePlanDTOFromJson(Map<String, dynamic> json) {
  return _ChargePlanDTO.fromJson(json);
}

/// @nodoc
mixin _$ChargePlanDTO {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  DeviceDTO get device => throw _privateConstructorUsedError;
  set device(DeviceDTO value) => throw _privateConstructorUsedError;
  ChargeRequestDTO get request => throw _privateConstructorUsedError;
  set request(ChargeRequestDTO value) => throw _privateConstructorUsedError;
  double get co2ValueSmart => throw _privateConstructorUsedError;
  set co2ValueSmart(double value) => throw _privateConstructorUsedError;
  double get co2ValueNotSmart => throw _privateConstructorUsedError;
  set co2ValueNotSmart(double value) => throw _privateConstructorUsedError;
  List<ChargePlanTimeDTO> get times => throw _privateConstructorUsedError;
  set times(List<ChargePlanTimeDTO> value) =>
      throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargePlanDTOCopyWith<ChargePlanDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePlanDTOCopyWith<$Res> {
  factory $ChargePlanDTOCopyWith(
          ChargePlanDTO value, $Res Function(ChargePlanDTO) then) =
      _$ChargePlanDTOCopyWithImpl<$Res, ChargePlanDTO>;
  @useResult
  $Res call(
      {int id,
      DeviceDTO device,
      ChargeRequestDTO request,
      double co2ValueSmart,
      double co2ValueNotSmart,
      List<ChargePlanTimeDTO> times,
      String status});

  $DeviceDTOCopyWith<$Res> get device;
  $ChargeRequestDTOCopyWith<$Res> get request;
}

/// @nodoc
class _$ChargePlanDTOCopyWithImpl<$Res, $Val extends ChargePlanDTO>
    implements $ChargePlanDTOCopyWith<$Res> {
  _$ChargePlanDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? device = null,
    Object? request = null,
    Object? co2ValueSmart = null,
    Object? co2ValueNotSmart = null,
    Object? times = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceDTO,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChargeRequestDTO,
      co2ValueSmart: null == co2ValueSmart
          ? _value.co2ValueSmart
          : co2ValueSmart // ignore: cast_nullable_to_non_nullable
              as double,
      co2ValueNotSmart: null == co2ValueNotSmart
          ? _value.co2ValueNotSmart
          : co2ValueNotSmart // ignore: cast_nullable_to_non_nullable
              as double,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<ChargePlanTimeDTO>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceDTOCopyWith<$Res> get device {
    return $DeviceDTOCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChargeRequestDTOCopyWith<$Res> get request {
    return $ChargeRequestDTOCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChargePlanDTOCopyWith<$Res>
    implements $ChargePlanDTOCopyWith<$Res> {
  factory _$$_ChargePlanDTOCopyWith(
          _$_ChargePlanDTO value, $Res Function(_$_ChargePlanDTO) then) =
      __$$_ChargePlanDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DeviceDTO device,
      ChargeRequestDTO request,
      double co2ValueSmart,
      double co2ValueNotSmart,
      List<ChargePlanTimeDTO> times,
      String status});

  @override
  $DeviceDTOCopyWith<$Res> get device;
  @override
  $ChargeRequestDTOCopyWith<$Res> get request;
}

/// @nodoc
class __$$_ChargePlanDTOCopyWithImpl<$Res>
    extends _$ChargePlanDTOCopyWithImpl<$Res, _$_ChargePlanDTO>
    implements _$$_ChargePlanDTOCopyWith<$Res> {
  __$$_ChargePlanDTOCopyWithImpl(
      _$_ChargePlanDTO _value, $Res Function(_$_ChargePlanDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? device = null,
    Object? request = null,
    Object? co2ValueSmart = null,
    Object? co2ValueNotSmart = null,
    Object? times = null,
    Object? status = null,
  }) {
    return _then(_$_ChargePlanDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceDTO,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ChargeRequestDTO,
      co2ValueSmart: null == co2ValueSmart
          ? _value.co2ValueSmart
          : co2ValueSmart // ignore: cast_nullable_to_non_nullable
              as double,
      co2ValueNotSmart: null == co2ValueNotSmart
          ? _value.co2ValueNotSmart
          : co2ValueNotSmart // ignore: cast_nullable_to_non_nullable
              as double,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<ChargePlanTimeDTO>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargePlanDTO implements _ChargePlanDTO {
  _$_ChargePlanDTO(
      {required this.id,
      required this.device,
      required this.request,
      required this.co2ValueSmart,
      required this.co2ValueNotSmart,
      required this.times,
      required this.status});

  factory _$_ChargePlanDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ChargePlanDTOFromJson(json);

  @override
  int id;
  @override
  DeviceDTO device;
  @override
  ChargeRequestDTO request;
  @override
  double co2ValueSmart;
  @override
  double co2ValueNotSmart;
  @override
  List<ChargePlanTimeDTO> times;
  @override
  String status;

  @override
  String toString() {
    return 'ChargePlanDTO(id: $id, device: $device, request: $request, co2ValueSmart: $co2ValueSmart, co2ValueNotSmart: $co2ValueNotSmart, times: $times, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargePlanDTOCopyWith<_$_ChargePlanDTO> get copyWith =>
      __$$_ChargePlanDTOCopyWithImpl<_$_ChargePlanDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargePlanDTOToJson(
      this,
    );
  }
}

abstract class _ChargePlanDTO implements ChargePlanDTO {
  factory _ChargePlanDTO(
      {required int id,
      required DeviceDTO device,
      required ChargeRequestDTO request,
      required double co2ValueSmart,
      required double co2ValueNotSmart,
      required List<ChargePlanTimeDTO> times,
      required String status}) = _$_ChargePlanDTO;

  factory _ChargePlanDTO.fromJson(Map<String, dynamic> json) =
      _$_ChargePlanDTO.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  DeviceDTO get device;
  set device(DeviceDTO value);
  @override
  ChargeRequestDTO get request;
  set request(ChargeRequestDTO value);
  @override
  double get co2ValueSmart;
  set co2ValueSmart(double value);
  @override
  double get co2ValueNotSmart;
  set co2ValueNotSmart(double value);
  @override
  List<ChargePlanTimeDTO> get times;
  set times(List<ChargePlanTimeDTO> value);
  @override
  String get status;
  set status(String value);
  @override
  @JsonKey(ignore: true)
  _$$_ChargePlanDTOCopyWith<_$_ChargePlanDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
