import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final String role;
  final String telephone;
  final bool isEmailVerified;

  const AuthUser({
    required this.telephone,
    required this.id,
    required this.email,
    required this.role,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified, 
        telephone: user.phoneNumber!,
        role: '',
      );
}
