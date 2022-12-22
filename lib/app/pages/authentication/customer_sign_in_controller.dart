import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/customer_service.dart';

class CustomerSignInController extends StateNotifier<AsyncValue> {
  CustomerSignInController({required this.customerService})
      : super(const AsyncData(null));

  final CustomerService customerService;

  Future<void> signIn(int customerId) async {
    print(customerId);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => customerService.signIn(customerId),
    );
  }
}

final customerSignInControllerProvider =
    StateNotifierProvider.autoDispose<CustomerSignInController, AsyncValue>(
        (ref) {
  return CustomerSignInController(
    customerService: ref.watch(customerServiceProvider),
  );
});
