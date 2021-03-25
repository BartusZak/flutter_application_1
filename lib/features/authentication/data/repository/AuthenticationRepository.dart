import 'dart:async';

import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> get status;

  Future<void> logIn({
    @required String username,
    @required String password,
  });

  Future<void> refreshTokens();

  Future<bool> isIdTokenValid();

  Future<bool> confirmRegistration({
    @required String username,
    @required String confirmationCode,
  });

  Future<bool> confirmEmail({
    @required String username,
    @required String confirmationCode,
  });

  Future<void> resendConfirmationCode({
    @required String username,
  });

  Future<void> resendEmailCode({@required String username});

  Future<void> confirmPassword(
      {@required String newPassword, @required String confirmationCode});

  Future<void> logOut();

  void dispose();
}
