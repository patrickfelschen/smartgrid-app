import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/app/services/auth_customer_service.dart';
import 'package:smartgrid/data/models/customer_creation_dto.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

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
    final service = ref.watch(authCustomerServiceProvider);
    return AuthStateNotifier(service);
  },
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._service, [AuthState? state])
      : super(state ?? const AuthState()) {
    checkAuthStatus();
  }

  final AuthCustomerService _service;

  Future<void> checkAuthStatus() async {
    state = state.copyWith(
      loading: true,
    );
    try {
      CustomerEntity customer = await _service.getLocalCustomer();
      await _service.signIn(customer.id);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: customer,
        loading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        loading: false,
      );
    }
  }

  Future<void> signIn(int customerId) async {
    state = state.copyWith(
      loading: true,
    );

    try {
      CustomerEntity customer = await _service.signIn(customerId);
      print("AuthProvider:SignIn:Customer: $customer");

      state = state.copyWith(
        user: customer,
        status: AuthStatus.authenticated,
        loading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        user: null,
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        loading: false,
      );
    }
  }

  Future<void> signUp(CustomerCreationDTO creationDTO) async {
    state = state.copyWith(
      loading: true,
    );

    try {
      CustomerEntity customer = await _service.signUp(creationDTO);
      print("AuthProvider:SignUp:Customer: $customer");

      state = state.copyWith(
        user: customer,
        status: AuthStatus.authenticated,
        loading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        user: null,
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        loading: false,
      );
    }
  }

  Future<void> updateCustomer(CustomerCreationDTO creationDTO) async {
    state = state.copyWith(
      loading: true,
    );

    try {
      CustomerEntity customer = await _service.updateCustomer(creationDTO);
      print("AuthProvider:updateCustomer:Customer: $customer");

      state = state.copyWith(
        user: customer,
        //status: AuthStatus.authenticated,
        loading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        user: null,
        //status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        loading: false,
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(
      loading: true,
    );

    try {
      await _service.signOut();

      state = state.copyWith(
        user: null,
        accessToken: null,
        status: AuthStatus.unauthenticated,
        loading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        user: null,
        accessToken: null,
        status: AuthStatus.unauthenticated,
        loading: false,
        errorMessage: null,
      );
    }
  }
}
