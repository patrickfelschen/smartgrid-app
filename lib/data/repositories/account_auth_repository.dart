import 'package:smartgrid/domain/entities/account_entity.dart';
import 'package:smartgrid/domain/repositories/auth_repository.dart';

class CustomerAuthRepository extends AuthRepository {
  @override
  Stream<AccountEntity?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<AccountEntity> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
