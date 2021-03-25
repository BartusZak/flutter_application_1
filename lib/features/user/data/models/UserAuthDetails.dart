import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserAuthDetails.g.dart';

@JsonSerializable()
class UserAuthDetails extends Equatable {
  UserAuthDetails({
    this.email,
    this.password,
  });

  final String email;
  final String password;

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password];

  factory UserAuthDetails.fromJson(Map<String, dynamic> json) =>
      _$UserAuthDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthDetailsToJson(this);
}
