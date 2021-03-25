import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/features/user/data/models/UserAuthDetails.dart';
import 'package:sigv4/sigv4.dart';

class IAMUserApi {
  IAMUserApi({
    @required Sigv4Client sigV4Client,
    @required Dio dioClient,
  })  : _sigV4Client = sigV4Client,
        _dioClient = dioClient,
        assert(sigV4Client != null),
        assert(dioClient != null);

  final Sigv4Client _sigV4Client;
  final Dio _dioClient;

  Future<UserAuthDetails> fetchDummyUserEmailAndPassword() async {
    final String url = 'serverUrl/users/demo/adminCreateUser';

    final request = _sigV4Client.request(url);

    Response response = await _dioClient.get(url,
        options: Options(headers: {
          ...request.headers,
        }));

    return UserAuthDetails.fromJson(response.data);
  }
}
