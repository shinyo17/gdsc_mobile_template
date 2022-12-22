import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:gdsc_mobile_template/views/code_input_screen.dart';
import 'package:get/get.dart';

class PhoneInputScreen extends StatefulWidget {
  PhoneInputScreen({Key? key}) : super(key: key);

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  AuthController authCtrl = Get.put(AuthController());
  final TextEditingController phoneCtrl = TextEditingController();
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
              "휴대폰 번호를 입력해 주세요.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            CupertinoTextField(
              controller: phoneCtrl,
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFE4E4E4),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              placeholder: "휴대폰 번호",
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                authCtrl.authorization(phone: phoneCtrl.text).then((value) {
                  Get.off(
                    CodeInputScreen(
                      phone: phoneCtrl.text,
                    ),
                  );
                });
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
