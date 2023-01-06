import 'package:dio/dio.dart';
import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/response/get_user_response.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/utils/token_manager.dart';

class UserService with TokenManager {
  String baseUrl = "$BASE_URL/api/v1/users";

  Future<UserModel?> getUser() async {
    try {
      final resp = await Dio().get(
        baseUrl,
        options: Options(
          headers: {"Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}"},
        ),
      );

      final responseValue = GetUserResponse.fromJson(resp.data);

      final user = responseValue.user;

      return user;
    } catch (e) {
      return null;
    }
  }
}
