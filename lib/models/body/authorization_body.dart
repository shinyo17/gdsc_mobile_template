import 'package:json_annotation/json_annotation.dart';

part "authorization_body.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorizationBody {
  final String phone;

  AuthorizationBody({
    required this.phone,
  });

  factory AuthorizationBody.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AuthorizationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationBodyToJson(this);
}
