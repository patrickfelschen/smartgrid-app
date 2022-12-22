import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/customer_service.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

@immutable
class SignInState {
  const SignInState({
    this.isInitial = true,
    this.isSuccessful = false,
    this.isFailure = false,
    this.isLoading = false,
  });

  final bool isInitial;
  final bool isSuccessful;
  final bool isFailure;
  final bool isLoading;

  SignInState copyWith({
    bool? isInitial,
    bool? isSuccessful,
    bool? isFailure,
    required bool isLoading,
  }) {
    return SignInState(
      isInitial: isInitial ?? this.isInitial,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      isFailure: isFailure ?? this.isFailure,
      isLoading: isLoading,
    );
  }
}

final customerSignInProvider =
    StateNotifierProvider.autoDispose<CustomerSignInNotifier, SignInState>(
        (ref) {
  return CustomerSignInNotifier(
    customerService: ref.watch(customerServiceProvider),
  );
});

class CustomerSignInNotifier extends StateNotifier<SignInState> {
  CustomerSignInNotifier({required this.customerService})
      : super(const SignInState());

  final CustomerService customerService;

  Future<void> signIn(int customerId) async {
    print(customerId);
    state = state.copyWith(isLoading: true);
    CustomerEntity customerEntity = await customerService.signIn(customerId);
    state = state.copyWith(isLoading: false, isSuccessful: true);
  }
}
