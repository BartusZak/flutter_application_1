import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel(this.id,
      {this.email,
      this.phoneNumber,
      this.familyName,
      this.givenName,
      this.emailVerified,
      this.phoneNumberVerified});

  final String id;
  final String email;
  final String phoneNumber;
  final String familyName;
  final String givenName;
  final bool emailVerified;
  final bool phoneNumberVerified;

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        email,
        phoneNumber,
        familyName,
        givenName,
        emailVerified,
        phoneNumberVerified
      ];

  static const empty = UserModel("-");

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
