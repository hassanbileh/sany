

import 'package:sany/services/auth/auth_user.dart';

abstract class AuthProvider {

  Future<void> initialise();

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  AuthUser? get currentUser;

  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<void> sendEmailVerification();

  Future<void> logOut();

}