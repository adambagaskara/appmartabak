// import 'dart:js';

import 'package:appmartabak/screen/tombol_masuk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_screen.dart';
import 'textfield.dart';

import 'login_or_register.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
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
        notMatchedPassword();
      }
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text, password: passwordController.text);
    //Navigator.pop(this.context);
  }

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

  void notMatchedPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Password tidak sama!'));
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
                Text('Silahkan Daftarkan diri Anda!'),
                SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                SizedBox(height: 10),
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     'Lupa Password?',
                      //     style: TextStyle(color: Colors.red),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Daftar",
                  onTap: signUserUp,
                ),
                const SizedBox(height: 20),
                Text('Sudah punya akun?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login sekarang!',
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
