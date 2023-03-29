import 'package:appmartabak/screen/auth_page.dart';
import 'package:appmartabak/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class LoginRegistC extends GetxController {
  RxBool showLoginPage = true.obs;

  togglePages() {
    showLoginPage.value = !showLoginPage.value;
    // print('$showLoginPage');
  }
}
