import 'package:flutter_application_1/features/user/data/models/UserAuthDetails.dart';
import 'package:flutter_application_1/features/user/data/models/UserModel/UserModel.dart';

abstract class UserRepository {
  Future<UserModel> getUser();

  Future<UserAuthDetails> fetchDummyUserEmailAndPassword();
}
