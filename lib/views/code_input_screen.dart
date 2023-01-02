import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/views/home_screen.dart';
import 'package:get/get.dart';

class CodeInputScreen extends StatelessWidget {
  CodeInputScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final String phone;
  AuthController authCtrl = Get.find<AuthController>();

  final TextEditingController codeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 24.0,
          ),
          children: [
            Text(
              "인증번호를 입력해 주세요.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            CupertinoTextField(
              controller: codeCtrl,
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFE4E4E4),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              placeholder: "인증 코드",
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                bool verified = false;
                bool signedUp = false;

                if (codeCtrl.text.isNotEmpty && codeCtrl.text.length == 6) {
                  verified = await authCtrl.codeConfirm(
                    phone: phone,
                    code: codeCtrl.text,
                  );
                }

                if (verified) {
                  signedUp = await authCtrl.checkSignedUp(
                    phone: phone,
                  );
                } else {
                  Get.snackbar("오류", "인증번호 확인 필요");
                }

                if (signedUp) {
                  Get.off(HomeScreen());
                } else {
                  Get.snackbar("TODO", "가입 과정 만들 예정");
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "인증하기",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
