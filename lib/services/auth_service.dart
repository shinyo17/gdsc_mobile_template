import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/body/authorization_body.dart';
import 'package:gdsc_mobile_template/models/body/code_confirm_body.dart';
import 'package:gdsc_mobile_template/models/body/sign_up_body.dart';
import 'package:gdsc_mobile_template/models/response/login_response.dart';
import 'package:gdsc_mobile_template/models/response/sign_up_response.dart';

import 'package:gdsc_mobile_template/utils/token_manager.dart';

class AuthService with TokenManager {
  String baseUrl = "$BASE_URL/api/v1/authorizations";

  Future<bool> authorization({required String phone}) async {
    try {
      final resp = await Dio().post(
        "$baseUrl",
        data: {
          "auth": AuthorizationBody(phone: phone).toJson(),
        },
      );

      return resp.data["status"] == "ok";
    } catch (e) {
      return false;
    }
  }

  Future<bool> codeConfirm(
      {required String phone, required String code}) async {
    try {
      final resp = await Dio().get(
        "$baseUrl",
        queryParameters: {
          "auth": CodeConfirmBody(phone: phone, code: code).toJson(),
        },
      );
      return resp.data["result"]["verify"] == "ok" ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkSignedUp({required String phone}) async {
    try {
      final resp = await Dio().post("$baseUrl/check_signed_up", data: {
        "auth": AuthorizationBody(phone: phone).toJson(),
      });

      var signedAt = resp.data["terms_accepted_at"];

      return signedAt != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp({
    required String phone,
    required String code,
  }) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String serialized = stringToBase64.encode("$phone:$code");
      final resp = await Dio().post(
        "$baseUrl/sign_up",
        options: Options(
          headers: {
            "Authorization": "Basic $serialized",
          },
        ),
        data: {
          "auth": SignUpBody(termsAcceptedAt: DateTime.now()).toJson(),
        },
      );

      final tokenData = SignUpResponse.fromJson(resp.data["token"]);

      saveToken(REFRESH_TOKEN_KEY, tokenData.refreshToken);
      saveToken(ACCESS_TOKEN_KEY, tokenData.accessToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({required String phone, required String code}) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String serialized = stringToBase64.encode("$phone:$code");

      final resp = await Dio().post(
        "$baseUrl/login",
        options: Options(
          headers: {
            "Authorization": "Basic $serialized",
          },
        ),
      );

      final tokenData = LoginResponse.fromJson(resp.data["token"]);

      saveToken(REFRESH_TOKEN_KEY, tokenData.refreshToken);
      saveToken(ACCESS_TOKEN_KEY, tokenData.accessToken);

      return true;
    } catch (e) {
      return false;
    }
  }
}
