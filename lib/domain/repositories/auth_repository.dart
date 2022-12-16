import 'package:smartgrid/domain/entities/customer_entity.dart';

abstract class AuthRepository {
  Stream<CustomerEntity?> authStateChanges();

  Future<CustomerEntity> signUp();

  Future<CustomerEntity> signIn();

  Future<void> signOut();
}
