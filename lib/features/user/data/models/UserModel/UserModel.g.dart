// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['id'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    familyName: json['familyName'] as String,
    givenName: json['givenName'] as String,
    emailVerified: json['emailVerified'] as bool,
    phoneNumberVerified: json['phoneNumberVerified'] as bool,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'familyName': instance.familyName,
      'givenName': instance.givenName,
      'emailVerified': instance.emailVerified,
      'phoneNumberVerified': instance.phoneNumberVerified,
    };
