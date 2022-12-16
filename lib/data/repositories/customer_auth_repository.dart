import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

class CustomerAuthRepository extends AuthRepository {
  @override
  Stream<CustomerEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<CustomerEntity> signUp(
    int id,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    CustomerEntity customerEntity = CustomerEntity(
      id: id,
      street: street,
      number: number,
      postalcode: postalcode,
      city: city,
    );

    await Future.delayed(const Duration(seconds: 1));

    print(customerEntity);

    return customerEntity;
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    CustomerEntity customerEntity = CustomerEntity(
      id: id,
      street: "Musterweg",
      number: "5",
      postalcode: "12345",
      city: "Musterstadt",
    );

    await Future.delayed(const Duration(seconds: 1));

    print(customerEntity);

    return customerEntity;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

final customerAuthRepositoryProvider = Provider<CustomerAuthRepository>((ref) {
  final customerAuthRepository = CustomerAuthRepository();
  ref.onDispose(() => customerAuthRepository.signOut());
  return customerAuthRepository;
});
