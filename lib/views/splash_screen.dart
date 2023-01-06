import 'package:flutter/material.dart';
import 'package:gdsc_mobile_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authCtrl = Get.put(AuthController());

  @override
  void initState() {
    // authCtrl.checkTokenStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
