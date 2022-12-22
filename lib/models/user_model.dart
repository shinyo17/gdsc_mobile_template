import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int id;
  final String? username;
  final String phone;

  UserModel({
    required this.id,
    required this.username,
    required this.phone,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
