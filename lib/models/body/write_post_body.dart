import 'package:json_annotation/json_annotation.dart';

part "write_post_body.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class WritePostBody {
  final String title;
  final String description;
  final int userId;

  WritePostBody({
    required this.title,
    required this.description,
    required this.userId,
  });

  factory WritePostBody.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WritePostBodyFromJson(json);

  Map<String, dynamic> toJson() => _$WritePostBodyToJson(this);
}
