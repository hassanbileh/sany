import 'package:sany/services/auth/auth_provider.dart';
import 'package:sany/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  AuthService(this.provider);
  final AuthProvider provider;

  @override
  Future<void> initialise() => provider.initialise();

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String phoneNumber,
  }) =>
      provider.createUser(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  
}
