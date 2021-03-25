import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/common/sharedpreferences/SharedPreferencesManager.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  SharedPreferencesManager sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  locator.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);
}
