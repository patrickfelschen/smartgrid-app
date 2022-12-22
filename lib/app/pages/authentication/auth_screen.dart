import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/app/pages/authentication/auth_provider.dart';
import 'package:smartgrid/app/pages/authentication/customer_sign_in_screen.dart';
import 'package:smartgrid/app/pages/dashboard/dashboard_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(
      authNotifierProvider.select((value) => value.status),
    );

    return Container(
      child: authStatus == AuthStatus.unauthenticated
          ? CustomerSignInScreen()
          : authStatus == AuthStatus.authenticated
              ? DashboardScreen()
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
