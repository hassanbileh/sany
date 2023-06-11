

import 'package:sany/services/auth/auth_user.dart';

abstract class AuthProvider {

  Future<void> initialise();

//
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });


  AuthUser? get currentUser;

  Future<AuthUser> createClient({
    required String email,
    required String? nom,
    required String password,
    required int? telephone,
  });

  Future<void> sendEmailVerification();

  Future<void> logOut();

}