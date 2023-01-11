import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:gdsc_mobile_template/models/user_model.dart';
import 'package:gdsc_mobile_template/views/home_screen.dart';
import 'package:get/get.dart';

class CodeInputScreen extends StatefulWidget {
  CodeInputScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final String phone;

  @override
  State<CodeInputScreen> createState() => _CodeInputScreenState();
}

class _CodeInputScreenState extends State<CodeInputScreen> {
  AuthController authCtrl = Get.find<AuthController>();

  final TextEditingController codeCtrl = TextEditingController();

  bool showSignUpModal = false;

  bool termsCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: showSignUpModal ? _bottomSheet() : const SizedBox.shrink(),
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
                    phone: widget.phone,
                    code: codeCtrl.text,
                  );
                }

                if (verified) {
                  signedUp = await authCtrl.checkSignedUp(
                    phone: widget.phone,
                  );
                } else {
                  Get.snackbar("오류", "인증번호 확인 필요");
                }
                if (signedUp) {
                  authCtrl
                      .login(phone: widget.phone, code: codeCtrl.text)
                      .then((result) {
                    if (result) {
                      Get.off(HomeScreen());
                    } else {
                      Get.snackbar("오류", "로그인 오류");
                    }
                  });
                } else {
                  setState(() {
                    showSignUpModal = true;
                  });
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

  Widget _bottomSheet() {
    return BottomSheet(
        elevation: 5.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.55,
              maxChildSize: 0.55,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
                  controller: scrollController,
                  children: [
                    Text(
                      "서비스 동의",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          termsCheck = !termsCheck;
                        });
                      },
                      child: checkBtn(
                        context,
                        "이용약관",
                        termsCheck,
                      ),
                    ),
                    SizedBox(height: 32.5),
                    _ContainedButton(
                      "동의하고 가입하기",
                      onTap: () async {
                        bool signUpResult = false;
                        if (termsCheck) {
                          signUpResult = await authCtrl.signUp(
                              phone: widget.phone, code: codeCtrl.text);
                        }
                        if (signUpResult) {
                          Get.off(HomeScreen());
                        }
                      },
                      buttonColor: termsCheck ? Colors.pink : Colors.grey,
                      textColor: Colors.white,
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget checkBtn(
    BuildContext context,
    String title,
    bool clickedBtn,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 14,
            color: clickedBtn ? Colors.pink : Colors.grey,
          ),
          SizedBox(width: 20),
          Text(
            "[필수] $title",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainedButton extends StatelessWidget {
  const _ContainedButton(
    this.text, {
    Key? key,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
