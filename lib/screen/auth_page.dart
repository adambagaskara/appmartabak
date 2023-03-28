import 'package:appmartabak/main.dart';
import 'package:appmartabak/screen/login_or_register.dart';
import 'package:appmartabak/screen/login_page.dart';
import 'package:appmartabak/screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
