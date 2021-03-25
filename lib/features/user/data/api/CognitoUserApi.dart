import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/common/CognitoDioClient.dart';

class CognitoUserApi {
  CognitoUserApi({
    @required CognitoDioClient cognitoDioClient,
  })  : _cognitoDioClient = cognitoDioClient,
        assert(cognitoDioClient != null);

  CognitoDioClient _cognitoDioClient;
}
