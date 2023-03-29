// import 'package:appmartabak/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import '../controller/login_or_regist_c.dart';
import 'register_page.dart';
import 'login_page.dart';

class LoginOrRegisterPage extends StatelessWidget {
  LoginOrRegisterPage({super.key});
  final mlr = Get.put(LoginRegistC());

  // bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (mlr.showLoginPage.value) {
        return LoginPage(onTap: mlr.togglePages);
      } else {
        return RegisterPage(
          onTap: mlr.togglePages,
        );
      }
    });
  }
}
