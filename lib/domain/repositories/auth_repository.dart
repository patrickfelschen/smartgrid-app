import 'package:smartgrid/domain/entities/account_entity.dart';

abstract class AuthRepository {
  Stream<AccountEntity?> authStateChanges();

  Future<AccountEntity> signInAnonymously();

  Future<void> signOut();
}
