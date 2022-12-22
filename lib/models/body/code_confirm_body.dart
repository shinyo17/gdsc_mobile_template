import 'package:json_annotation/json_annotation.dart';

part "code_confirm_body.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class CodeConfirmBody {
  final String phone;
  final String code;

  CodeConfirmBody({
    required this.phone,
    required this.code,
  });

  factory CodeConfirmBody.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CodeConfirmBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CodeConfirmBodyToJson(this);
}
