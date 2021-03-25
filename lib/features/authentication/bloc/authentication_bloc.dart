import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/authentication/data/repository/AuthenticationRepository.dart';
import 'package:flutter_application_1/features/user/data/models/UserModel/UserModel.dart';
import 'package:flutter_application_1/features/user/data/repository/UserRepository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UserRepository userRepository,
  })  : assert(authenticationRepository != null),
        assert(userRepository != null),
        _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      yield* _authenticationLogoutRequested(event);
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        if (user != null) {
          return AuthenticationState.authenticated(user);
        }
        return const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Stream<AuthenticationState> _authenticationLogoutRequested(
      AuthenticationLogoutRequested event) async* {
    await _authenticationRepository.logOut();
  }

  Future<UserModel> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } on Exception {
      return null;
    }
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> json) {
    try {
      final user = UserModel.fromJson(json);
      if (user != UserModel.empty)
        return AuthenticationState.authenticated(user);
      else
        return AuthenticationState.unauthenticated();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    if (state is AuthenticationState) {
      return state.user.toJson();
    }
    return null;
  }
}
