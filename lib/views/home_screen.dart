import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            Text("홈 화면"),
          ],
        ),
      ),
    );
  }
}
