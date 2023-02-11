import 'package:dio/dio.dart';
import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/body/write_post_body.dart';
import 'package:gdsc_mobile_template/models/response/get_user_response.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/utils/token_manager.dart';

class PostService with TokenManager {
  String baseUrl = "$BASE_URL/api/v1/posts";

  Future<bool> writePost({
    required String title,
    required String description,
    required int userId,
  }) async {
    try {
      final resp = await Dio().post(
        baseUrl,
        options: Options(
          headers: {"Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}"},
        ),
        data: {
          "post": WritePostBody(
            title: title,
            description: description,
            userId: userId,
          ).toJson(),
        },
      );

      print(resp);

      return true;
    } catch (e) {
      return false;
    }
  }
}
