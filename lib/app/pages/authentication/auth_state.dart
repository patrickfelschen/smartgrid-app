import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/domain/entities/customer_entity.dart';

class AuthState {
  final String? accessToken;
  final CustomerEntity? user;
  final AuthStatus status;
  final String? errorMessage;
  final bool loading;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  AuthState({
    this.accessToken,
    this.user,
    this.status = AuthStatus.unauthenticated,
    this.errorMessage,
    this.loading = false,
  });

  AuthState copyWith({
    String? accessToken,
    CustomerEntity? user,
    AuthStatus? status,
    String? errorMessage,
    bool? loading,
  }) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
      status: status ?? this.status,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      status: AuthStatus.unauthenticated,
      user: null,
      accessToken: null,
      errorMessage: null,
      loading: false,
    );
  }

  @override
  String toString() =>
      'status $status accessToken $accessToken user ${user.toString()} ';
}
