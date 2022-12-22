import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/app/pages/authentication/auth_state.dart';
import 'package:smartgrid/app/services/customer_service.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';
import 'package:smartgrid/data/dtos/customer_dto.dart';
import 'package:smartgrid/utils/constants.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    final service = ref.watch(customerServiceProvider);
    return AuthStateNotifier(service);
  },
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._service, [AuthState? state])
      : super(state ?? AuthState.initial()) {
    checkAuthStatus();
  }

  final CustomerService _service;

  Future<void> checkAuthStatus() async {
    // check storage for existing token/user
    final box = Hive.box(Constants.authStorageKey);
    //final token = box.get('token');
    final user = box.get('user');

    // if authenticated, update state accordingly
    if (user != null && user.toString().isNotEmpty) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: CustomerDTO.fromDTO(
          CustomerDTO.fromJson(
            user.toString(),
          ),
        ),
      );
      return;
    }
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
    );
  }

  Future<void> signIn(int customerId) async {
    try {
      state = state.copyWith(
        loading: true,
        errorMessage: '',
      );

      final customer = await _service.signIn(customerId);

      final box = Hive.box(Constants.authStorageKey);
      await box.put('user', CustomerDTO.toDTO(customer).toJson());

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

  Future<void> signUp(CustomerCreationDTO creationDTO) async {
    try {
      state = state.copyWith(
        loading: true,
        errorMessage: '',
      );

      final customer = await _service.signUp(creationDTO);

      final box = Hive.box(Constants.authStorageKey);
      await box.put('user', CustomerDTO.toDTO(customer).toJson());

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
