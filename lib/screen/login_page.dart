// import 'dart:js';

import 'package:appmartabak/screen/tombol_masuk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_screen.dart';
import 'textfield.dart';

import 'login_or_register.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap}); //required diilangin

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  Future signUserIn() async {
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
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: usernameController.text, password: passwordController.text);
  //   Navigator.pop(this.context);
  // }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Email salah!'));
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password salah!'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(height: 70),
                Text('Silahkan Login untuk Memesan Martabak!'),
                SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       // Padding(
                //       //   padding: const EdgeInsets.all(8.0),
                //       //   child: Text(
                //       //     'Lupa Password?',
                //       //     style: TextStyle(color: Colors.red),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Masuk",
                  onTap: signUserIn,
                ),
                const SizedBox(height: 20),
                Text('Belum punya akun?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Daftar Sekarang!',
                    style: TextStyle(
                        color: Colors.brown, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
