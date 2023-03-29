import 'package:appmartabak/screen/auth_page.dart';
import 'package:appmartabak/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class RegistC extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp(BuildContext context) async {
//     showDialog(
//       context: this.context,
//       builder: (context) {
//         return const Center(
// //child: CircularProgressIndicator(),
//             );
//       },
//     );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      } else {
        notMatchedPassword(context);
      }
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage(context);
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage(context);
      }
    }
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text, password: passwordController.text);
    //Navigator.pop(this.context);
  }

  void wrongEmailMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Email salah!'));
      },
    );
  }

  void wrongPasswordMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password salah!'));
      },
    );
  }

  void notMatchedPassword(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password tidak sama!'));
      },
    );
  }
}
