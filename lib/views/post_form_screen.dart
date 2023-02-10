import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class PostFormScreen extends StatelessWidget {
  PostFormScreen({super.key});

  AuthController authCtrl = Get.find<AuthController>();

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          _TextFieldWidget(
            textCtrl: titleCtrl,
            placeholder: "제목",
          ),
          _TextFieldWidget(
            textCtrl: descriptionCtrl,
            placeholder: "내용",
            maxLines: 5,
          ),
        ],
      )),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    super.key,
    required this.textCtrl,
    required this.placeholder,
    this.maxLines,
  });

  final TextEditingController textCtrl;
  final String placeholder;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textCtrl,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFE4E4E4),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      placeholder: placeholder,
      maxLines: maxLines,
    );
  }
}
