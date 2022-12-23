import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartgrid/app/enums/auth_status.dart';
import 'package:smartgrid/app/pages/authentication/sign_in_screen.dart';
import 'package:smartgrid/app/pages/dashboard/dashboard_screen.dart';
import 'package:smartgrid/app/providers/auth_provider.dart';

class AuthWrapperScreen extends ConsumerWidget {
  const AuthWrapperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(
      authNotifierProvider.select((value) => value.status),
    );

    return Container(
      child: authStatus == AuthStatus.unauthenticated
          ? SignInScreen()
          : authStatus == AuthStatus.authenticated
              ? DashboardScreen()
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
