// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserAuthDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthDetails _$UserAuthDetailsFromJson(Map<String, dynamic> json) {
  return UserAuthDetails(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserAuthDetailsToJson(UserAuthDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
