// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiErrorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) {
  return ApiErrorModel(
    errorType: json['errorType'] as String,
    errorMessage: json['errorMessage'] as String,
  );
}

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'errorType': instance.errorType,
      'errorMessage': instance.errorMessage,
    };
