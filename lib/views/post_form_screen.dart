import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/post_controller.dart';
import 'package:gdsc_mobile_template/views/home_screen.dart';
import 'package:get/get.dart';

class PostFormScreen extends StatelessWidget {
  PostFormScreen({super.key});

  PostController postCtrl = Get.put(PostController());

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              _TextFieldWidget(
                textCtrl: titleCtrl,
                placeholder: "제목",
              ),
              SizedBox(height: 30),
              _TextFieldWidget(
                textCtrl: descriptionCtrl,
                placeholder: "내용",
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (titleCtrl.text.isNotEmpty && descriptionCtrl.text.isNotEmpty) {
            final result = await postCtrl.writePost(
              title: titleCtrl.text,
              description: descriptionCtrl.text,
            );
            if (result) {
              Get.offAll(const HomeScreen());
            }
          }
        },
        child: const Icon(Icons.save),
      ),
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
