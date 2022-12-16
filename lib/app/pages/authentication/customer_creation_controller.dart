import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/services/customer_service.dart';
import 'package:smartgrid/data/dtos/customer_creation_dto.dart';

class CustomerCreationController extends StateNotifier<AsyncValue<void>> {
  CustomerCreationController({required this.customerService})
      : super(const AsyncData<void>(null));

  final CustomerService customerService;

  Future<void> signUp(CustomerCreationDTO creationDTO) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => customerService.signUp(creationDTO),
    );
  }
}

final customerCreationControllerProvider = StateNotifierProvider.autoDispose<
    CustomerCreationController, AsyncValue<void>>((ref) {
  return CustomerCreationController(
    customerService: ref.watch(customerServiceProvider),
  );
});
