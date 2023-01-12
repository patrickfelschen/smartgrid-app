import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/app/services/customer_service.dart';
import 'package:smartgrid/data/models/customer_creation_dto.dart';
import 'package:smartgrid/data/models/customer_dto.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/utils/constants.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) String? accessToken,
    @Default(null) CustomerEntity? user,
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(null) String? errorMessage,
    @Default(false) bool loading,
  }) = _AuthState;

  const AuthState._();
}

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    final service = ref.watch(customerServiceProvider);
    return AuthStateNotifier(service);
  },
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._service, [AuthState? state])
      : super(state ?? const AuthState()) {
    checkAuthStatus();
  }

  final CustomerService _service;

  Future<void> checkAuthStatus() async {
    state = state.copyWith(
      loading: true,
    );
    await Hive.openBox(Constants.authStorageKey);
    // check storage for existing token/user
    final box = Hive.box(Constants.authStorageKey);
    //final token = box.get('token');
    dynamic userData = box.get('user');

    // if authenticated, update state accordingly
    if (userData != null && userData.toString().isNotEmpty) {
      Map<String, dynamic> userJson = json.decode(userData);
      CustomerDTO customerDTO = CustomerDTO.fromJson(userJson);

      try {
        await _service.signIn(customerDTO.id);
      } catch (e) {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: e.toString(),
          loading: false,
        );
        return;
      }

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: CustomerDTO.fromDTO(customerDTO),
        loading: false,
      );
      return;
    }

    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      loading: false,
    );
  }

  Future<void> signIn(int customerId) async {
    try {
      state = state.copyWith(
        loading: true,
        errorMessage: '',
      );

      CustomerEntity customer = await _service.signIn(customerId);
      CustomerDTO customerDTO = CustomerDTO.toDTO(customer);

      final box = Hive.box(Constants.authStorageKey);
      await box.put('user', json.encode(customerDTO.toJson()));

      state = state.copyWith(
        accessToken: "",
        user: customer,
        status: AuthStatus.authenticated,
        errorMessage: '',
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(
        loading: false,
      );
    }
  }

  Future<void> signUp(CustomerCreationDTO creationDTO) async {
    try {
      state = state.copyWith(
        loading: true,
        errorMessage: '',
      );

      final customer = await _service.signUp(creationDTO);

      final box = Hive.box(Constants.authStorageKey);
      await box.put('user', json.encode(creationDTO.toJson()));

      state = state.copyWith(
        accessToken: "",
        user: customer,
        status: AuthStatus.authenticated,
        errorMessage: '',
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(
        loading: false,
      );
    }
  }

  Future<void> updateCustomer(CustomerCreationDTO creationDTO) async {
    try {
      state = state.copyWith(
        loading: true,
        errorMessage: '',
      );

      final customer = await _service.updateCustomer(creationDTO);

      final box = Hive.box(Constants.authStorageKey);
      await box.put('user', json.encode(creationDTO.toJson()));

      state = state.copyWith(
        accessToken: "",
        user: customer,
        status: AuthStatus.authenticated,
        errorMessage: '',
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(
        loading: false,
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(
      loading: true,
      errorMessage: '',
    );

    // do some API stuff
    await Future.delayed(const Duration(milliseconds: 300));

    final box = Hive.box(Constants.authStorageKey);
    await box.delete('user');

    state = state.copyWith(
      user: null,
      accessToken: null,
      status: AuthStatus.unauthenticated,
      loading: false,
    );
  }
}
