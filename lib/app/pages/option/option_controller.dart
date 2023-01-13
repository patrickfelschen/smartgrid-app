import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/auth_customer_service.dart';

class OptionController extends StateNotifier<AsyncValue<void>> {
  OptionController({required this.customerService})
      : super(const AsyncData<void>(null));

  final AuthCustomerService customerService;

  Future<void> signOut() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => customerService.signOut(),
    );
  }
}

final optionControllerProvider =
    StateNotifierProvider.autoDispose<OptionController, AsyncValue<void>>(
        (ref) {
  return OptionController(
    customerService: ref.watch(authCustomerServiceProvider),
  );
});
