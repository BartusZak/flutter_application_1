import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sigv4/sigv4.dart';

import 'backup_main.dart';
import 'common/CognitoDioClient.dart';
import 'common/injector/injector.dart';
import 'features/authentication/data/repository/CognitoAuthenticationRepository.dart';
import 'features/user/data/api/CognitoUserApi.dart';
import 'features/user/data/api/IAMUserApi.dart';
import 'features/user/data/repository/AWSUserRepository.dart';
import 'features/user/data/repository/UserRepository.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        'onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build();
  await setupLocator();

  final _sigV4Client = Sigv4Client(
    keyId: "",
    accessKey: "accessKey",
    region: "region",
    serviceName: "serviceName",
  );

  final _sigV4S3Client = Sigv4Client(
    keyId: "keyId",
    accessKey: "accessKey",
    region: "region",
    serviceName: "s3",
  );

  final CognitoAuthenticationRepository _cognitoAuthenticationRepository =
      new CognitoAuthenticationRepository();

  final CognitoDioClient _cognitoDioClient = new CognitoDioClient(
      authenticationRepository: _cognitoAuthenticationRepository);

  //TODO: Make separate class
  final Dio _dioClient = new Dio();
  _dioClient.options.baseUrl = "serverUrl";

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<UserRepository>(
        create: (context) => AWSUserRepository(
            iamUserApi:
                IAMUserApi(dioClient: _dioClient, sigV4Client: _sigV4Client),
            cognitoUserApi:
                CognitoUserApi(cognitoDioClient: _cognitoDioClient))),
  ], child: MyApp()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = true;
}
