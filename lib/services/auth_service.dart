import 'package:dio/dio.dart';
import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/body/authorization_body.dart';
import 'package:gdsc_mobile_template/models/body/code_confirm_body.dart';

class AuthService {
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
}
