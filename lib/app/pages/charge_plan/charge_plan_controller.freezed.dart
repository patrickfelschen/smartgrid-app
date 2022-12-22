// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_plan_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChargePlanState {
  ChargePlanEntity? get chargePlan => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChargePlanStateCopyWith<ChargePlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePlanStateCopyWith<$Res> {
  factory $ChargePlanStateCopyWith(
          ChargePlanState value, $Res Function(ChargePlanState) then) =
      _$ChargePlanStateCopyWithImpl<$Res, ChargePlanState>;
  @useResult
  $Res call({ChargePlanEntity? chargePlan, StateStatus status});
}

/// @nodoc
class _$ChargePlanStateCopyWithImpl<$Res, $Val extends ChargePlanState>
    implements $ChargePlanStateCopyWith<$Res> {
  _$ChargePlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chargePlan = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      chargePlan: freezed == chargePlan
          ? _value.chargePlan
          : chargePlan // ignore: cast_nullable_to_non_nullable
              as ChargePlanEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargePlanStateCopyWith<$Res>
    implements $ChargePlanStateCopyWith<$Res> {
  factory _$$_ChargePlanStateCopyWith(
          _$_ChargePlanState value, $Res Function(_$_ChargePlanState) then) =
      __$$_ChargePlanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChargePlanEntity? chargePlan, StateStatus status});
}

/// @nodoc
class __$$_ChargePlanStateCopyWithImpl<$Res>
    extends _$ChargePlanStateCopyWithImpl<$Res, _$_ChargePlanState>
    implements _$$_ChargePlanStateCopyWith<$Res> {
  __$$_ChargePlanStateCopyWithImpl(
      _$_ChargePlanState _value, $Res Function(_$_ChargePlanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chargePlan = freezed,
    Object? status = null,
  }) {
    return _then(_$_ChargePlanState(
      chargePlan: freezed == chargePlan
          ? _value.chargePlan
          : chargePlan // ignore: cast_nullable_to_non_nullable
              as ChargePlanEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$_ChargePlanState extends _ChargePlanState {
  const _$_ChargePlanState(
      {this.chargePlan = null, this.status = StateStatus.initial})
      : super._();

  @override
  @JsonKey()
  final ChargePlanEntity? chargePlan;
  @override
  @JsonKey()
  final StateStatus status;

  @override
  String toString() {
    return 'ChargePlanState(chargePlan: $chargePlan, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargePlanState &&
            (identical(other.chargePlan, chargePlan) ||
                other.chargePlan == chargePlan) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chargePlan, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargePlanStateCopyWith<_$_ChargePlanState> get copyWith =>
      __$$_ChargePlanStateCopyWithImpl<_$_ChargePlanState>(this, _$identity);
}

abstract class _ChargePlanState extends ChargePlanState {
  const factory _ChargePlanState(
      {final ChargePlanEntity? chargePlan,
      final StateStatus status}) = _$_ChargePlanState;
  const _ChargePlanState._() : super._();

  @override
  ChargePlanEntity? get chargePlan;
  @override
  StateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ChargePlanStateCopyWith<_$_ChargePlanState> get copyWith =>
      throw _privateConstructorUsedError;
}
