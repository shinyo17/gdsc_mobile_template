import 'package:gdsc_mobile_template/data.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/services/auth_service.dart';
import 'package:gdsc_mobile_template/services/user_service.dart';
import 'package:gdsc_mobile_template/utils/token_manager.dart';
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
}
