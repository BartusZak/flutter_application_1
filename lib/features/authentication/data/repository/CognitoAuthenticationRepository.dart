import 'dart:async';

import 'AuthenticationRepository.dart';

class UserEmailConfirmationNecessaryException implements Exception {}

class CognitoAuthenticationRepository implements AuthenticationRepository {
  @override
  Future<bool> confirmEmail({String username, String confirmationCode}) {
    // TODO: implement confirmEmail
    throw UnimplementedError();
  }

  @override
  Future<void> confirmPassword({String newPassword, String confirmationCode}) {
    // TODO: implement confirmPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> confirmRegistration({String username, String confirmationCode}) {
    // TODO: implement confirmRegistration
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<bool> isIdTokenValid() {
    // TODO: implement isIdTokenValid
    throw UnimplementedError();
  }

  @override
  Future<void> logIn({String username, String password}) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> refreshTokens() {
    // TODO: implement refreshTokens
    throw UnimplementedError();
  }

  @override
  Future<void> resendConfirmationCode({String username}) {
    // TODO: implement resendConfirmationCode
    throw UnimplementedError();
  }

  @override
  Future<void> resendEmailCode({String username}) {
    // TODO: implement resendEmailCode
    throw UnimplementedError();
  }

  @override
  // TODO: implement status
  Stream<AuthenticationStatus> get status => throw UnimplementedError();
}
