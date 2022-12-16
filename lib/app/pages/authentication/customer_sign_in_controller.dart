import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/customer_service.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';

class CustomerSignInController extends StateNotifier<AsyncValue<void>> {
  CustomerSignInController({required this.customerService})
      : super(const AsyncData<void>(null));

  final CustomerService customerService;

  Future<void> signIn(int id) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(() => customerService.signIn(id));
  }
}

final customerSignInControllerProvider = StateNotifierProvider.autoDispose<
    CustomerSignInController, AsyncValue<void>>((ref) {
  return CustomerSignInController(
      customerService: ref.watch(customerServiceProvider));
});
