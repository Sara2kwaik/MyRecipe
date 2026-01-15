import 'package:app_test_flutter/widget/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 241, 205),
      body: LoginBody(),
    );
  }
}
