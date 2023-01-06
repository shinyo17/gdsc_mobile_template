import 'package:json_annotation/json_annotation.dart';

part "sign_up_response.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class SignUpResponse {
  final String refreshToken;
  final String accessToken;

  SignUpResponse({
    required this.refreshToken,
    required this.accessToken,
  });

  factory SignUpResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SignUpResponseFromJson(json);
}
