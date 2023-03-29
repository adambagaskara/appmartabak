// import 'dart:js';

import 'package:appmartabak/screen/tombol_masuk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/register_c.dart';
import 'main_screen.dart';
import 'textfield.dart';

import 'login_or_register.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  final rc = Get.put(RegistC());

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
                  controller: rc.usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                    controller: rc.passwordController,
                    hintText: 'Password',
                    obscureText: true),
                SizedBox(height: 10),
                MyTextField(
                    controller: rc.confirmPasswordController,
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
                  onTap: () => rc.signUserUp(context),
                ),
                const SizedBox(height: 20),
                Text('Sudah punya akun?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
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
