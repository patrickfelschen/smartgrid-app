import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

import '../../domain/repositories/auth_repository.dart';

class TestAuthRepository implements AuthRepository {
  @override
  Stream<CustomerEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<CustomerEntity> signIn(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(
      CustomerEntity(
        id: 1000,
        hubId: 2000,
        street: "Musterstraße",
        number: "42",
        postalcode: "01234",
        city: "Musterstadt",
      ),
    );
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<CustomerEntity> signUp(
    int id,
    int hubId,
    String street,
    String number,
    String postalcode,
    String city,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(
      CustomerEntity(
        id: id,
        hubId: hubId,
        street: street,
        number: number,
        postalcode: postalcode,
        city: city,
      ),
    );
  }
}

final testAuthRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerAuthRepository = TestAuthRepository();
  return customerAuthRepository;
});
