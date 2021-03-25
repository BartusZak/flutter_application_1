import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/user/data/api/CognitoUserApi.dart';
import 'package:flutter_application_1/features/user/data/api/IAMUserApi.dart';
import 'package:flutter_application_1/features/user/data/models/UserAuthDetails.dart';
import 'package:flutter_application_1/features/user/data/models/UserModel/UserModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'UserRepository.dart';

class AWSUserRepository implements UserRepository {
  AWSUserRepository(
      {@required IAMUserApi iamUserApi,
      @required CognitoUserApi cognitoUserApi})
      : _iamUserApi = iamUserApi,
        _cognitoUserApi = cognitoUserApi,
        assert(iamUserApi != null),
        assert(cognitoUserApi != null);

  UserModel _user;
  IAMUserApi _iamUserApi;
  CognitoUserApi _cognitoUserApi;

  Future<UserModel> getUser() async {
    if (_user != null) return _user;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //TODO: Fetch data from User API

    _user = UserModel(prefs.getString('sub'),
        familyName: prefs.getString('family_name'),
        givenName: prefs.getString('given_name'),
        email: prefs.getString('email'),
        emailVerified: prefs.getBool('email_verified'),
        phoneNumber: prefs.getString('phone_number'),
        phoneNumberVerified: prefs.getBool('phone_number_verified'));

    return _user;
  }

  @override
  Future<UserAuthDetails> fetchDummyUserEmailAndPassword() async =>
      await _iamUserApi.fetchDummyUserEmailAndPassword();
}
