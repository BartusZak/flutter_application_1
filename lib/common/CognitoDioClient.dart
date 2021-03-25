import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/common/sharedpreferences/SharedPreferencesManager.dart';

import 'injector/injector.dart';

class CognitoDioClient {
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  final Dio _cognitoDioClient = new Dio();

  CognitoDioClient({@required authenticationRepository})
      : assert(authenticationRepository != null) {
    _cognitoDioClient.options.baseUrl = "serverUrl";
    _cognitoDioClient.interceptors
          ..add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
            final String idToken =
                _sharedPreferencesManager.getString('idToken');

            options.headers[HttpHeaders.authorizationHeader] =
                'Bearer $idToken';
            return options;
          }, onError: (DioError error) async {
            final bool _isIdTokenValid = true;
            if (!_isIdTokenValid) {
              RequestOptions options = error.request;
              try {} catch (e) {
                print('Refresh Token failed');
                return e;
              }
              _cognitoDioClient.unlock();
              _cognitoDioClient.interceptors.responseLock.unlock();
              _cognitoDioClient.interceptors.errorLock.unlock();
              return _cognitoDioClient.request(options.path, options: options);
            }
            return error;
          }))
        // ..add(LogInterceptor(responseBody: false));
        ;
  }

  Future<Response> get(path) => _cognitoDioClient.get(path);

  Future<Response> put(path, {data}) => _cognitoDioClient.put(path, data: data);

  Future<Response> post(path, {data}) =>
      _cognitoDioClient.post(path, data: data);
}
