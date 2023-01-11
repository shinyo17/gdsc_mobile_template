import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/views/phone_input_screen.dart';
import 'package:gdsc_mobile_template/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(_App());
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC Hongik Mobile',
      home: SplashScreen(),
    );
  }
}
