import 'package:flutter_application_1/features/app/data/models/ApiErrorModel.dart';

class AppException implements Exception {
  final _message;
  final _prefix;
  final ApiErrorModel errorModel;

  AppException([this._message, this._prefix, this.errorModel]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([ApiErrorModel errorModel, String message])
      : super(message, "Error During Communication: ", errorModel);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
