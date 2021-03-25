import 'package:json_annotation/json_annotation.dart';

part 'ApiErrorModel.g.dart';

@JsonSerializable()
class ApiErrorModel {
  ApiErrorModel({this.errorType, this.errorMessage});

  final String errorType;
  final String errorMessage;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  @override
  String toString() =>
      "ApiErrorModel: {errorType: $errorType, errorMessage: $errorMessage}";
}
