import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/services/auth_service.dart';
import 'package:gdsc_mobile_template/services/user_service.dart';
import 'package:gdsc_mobile_template/utils/token_manager.dart';
import 'package:gdsc_mobile_template/views/home_screen.dart';
import 'package:gdsc_mobile_template/views/phone_input_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with TokenManager {
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  Rxn<UserModel> currentUser = Rxn<UserModel>();

  Future<void> authorization({required String phone}) async {
    await authService.authorization(phone: phone);
  }

  Future<bool> codeConfirm(
      {required String phone, required String code}) async {
    bool result = await authService.codeConfirm(phone: phone, code: code);
    return result;
  }

  Future<bool> checkSignedUp({
    required String phone,
  }) async {
    bool result = await authService.checkSignedUp(phone: phone);

    return result;
  }

  Future<bool> signUp({
    required String phone,
    required String code,
  }) async {
    bool result = await authService.signUp(phone: phone, code: code);

    if (result) {
      final user = await userService.getUser();
      currentUser.value = user;
    }

    return result;
  }

  Future<bool> login({required String phone, required String code}) async {
    try {
      final resp = await authService.login(phone: phone, code: code);

      return resp;
    } catch (e) {
      return false;
    }
  }

  Future<void> checkTokenStatus() async {
    String? accessToken = getToken(ACCESS_TOKEN_KEY);

    if (accessToken == null || accessToken.isEmpty) {
      _moveToSignIn(3000);
      return;
    }
    userService.getUser().then((user) {
      if (user is UserModel) {
        currentUser.value = user;
        _moveToHome(3000);
        return;
      } else {
        _moveToSignIn(3000);
        return;
      }
    });
  }

  void _moveToSignIn(int? delay) {
    Future.delayed(Duration(milliseconds: delay as int), () {
      Get.off(PhoneInputScreen());
    });
  }

  void _moveToHome(int? delay) {
    Future.delayed(Duration(milliseconds: delay as int), () {
      Get.offAll(() => HomeScreen());
    });
  }
}
