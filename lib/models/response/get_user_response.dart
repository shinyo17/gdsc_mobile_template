import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetUserResponse {
  final UserModel? user;

  GetUserResponse({
    required this.user,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}
