import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/services/auth_service.dart';
import 'package:gdsc_mobile_template/utils/token_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with TokenManager {
  final AuthService authService = AuthService();

  Future<void> checkTokenStatus() async {
    String? accessToken = getToken(ACCESS_TOKEN_KEY);
    if (accessToken == null || accessToken.isEmpty) {
      // TODO moveToSignIn;
      // return;
    }
    //   try {
    //     getMe();
    //     _moveToMainTab(3000);
    //   } catch (e) {
    //      final isStatus401 = err.response?.statusCode == 401;
    //      TODO tokenRefresh, token 다시 저장
    //      TODO 성공하면 moveToMainTab,
    //      TODO 성공하지 못하면 _moveToSignIn(3000);
    //   }
  }

  // void _moveToSignIn(int? delay) {
  //   Future.delayed(Duration(milliseconds: delay as int), () {
  //     Get.off(SignPage());
  //   });
  // }

  // void _moveToMainTab(int? delay) {
  //   Future.delayed(Duration(milliseconds: delay as int), () {
  //     Get.offAll(() => AfterLoginPage());
  //     // Get.offAll(() => MainTab());
  //     // Get.off(MainTab());
  //   });
  // }

  Future<void> authorization({required String phone}) async {
    await authService.authorization(phone: phone);
  }

  Future<bool> codeConfirm(
      {required String phone, required String code}) async {
    bool result = await authService.codeConfirm(phone: phone, code: code);
    return result;
  }
}
