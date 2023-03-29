import 'package:appmartabak/screen/auth_page.dart';
import 'package:appmartabak/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class LoginC extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUserIn(BuildContext context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim());

    // showDialog(
    //   context: this.context,
    //   builder: (context) {
    //     return const Center(
    //      child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      // Get.to(MainScreen());
      //  print(response);
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage(context);
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage(context);
      }
    }
  }

  wrongEmailMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Email salah!'));
      },
    );
  }

  wrongPasswordMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password salah!'));
      },
    );
  }
}
