// import 'dart:html';

import 'package:appmartabak/screen/auth_page.dart';
import 'package:appmartabak/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

import '../screen/main_screen.dart';

class MartabakC extends GetxController {
  var jumlah1 = 0.obs;
  var jumlah2 = 0.obs;
  var jumlah3 = 0.obs;
  var jumlah4 = 0.obs;
  var jumlah5 = 0.obs;
  var jumlah6 = 0.obs;
  var jumlah7 = 0.obs;
  var jumlah8 = 0.obs;
  var jumlahtotal = 0.obs;
  // var namaPembeli = ''.obs;
  // var email = ''.obs;
  // var telp = ''.obs;
  var namaToko = ''.obs;
  var message = ''.obs;
  var validemail = TextEditingController();
  var validnama = TextEditingController();
  var validtelp = TextEditingController();

  // document IDs
  List docIDs = [];
  List listOrders = [];

  functionKurangJumlah1() {
    if (jumlah1 < 1) {
    } else {
      jumlah1--;
      jumlahtotal = jumlahtotal - 10000;
    }
  }

  functionTambahJumlah1() {
    jumlah1++;
    jumlahtotal = jumlahtotal + 10000;
  }

  functionKurangJumlah2() {
    if (jumlah2 < 1) {
    } else {
      jumlah2--;
      jumlahtotal = jumlahtotal - 15000;
    }
  }

  functionTambahJumlah2() {
    jumlah2++;
    jumlahtotal = jumlahtotal + 15000;
  }

  functionKurangJumlah3() {
    if (jumlah3 < 1) {
    } else {
      jumlah3--;
      jumlahtotal = jumlahtotal - 20000;
    }
  }

  functionTambahJumlah3() {
    jumlah3++;
    jumlahtotal = jumlahtotal + 20000;
  }

  functionKurangJumlah4() {
    if (jumlah4 < 1) {
    } else {
      jumlah4--;
      jumlahtotal = jumlahtotal - 25000;
    }
  }

  functionTambahJumlah4() {
    jumlah4++;
    jumlahtotal = jumlahtotal + 25000;
  }

  functionKurangJumlah5() {
    if (jumlah5 < 1) {
    } else {
      jumlah5--;
      jumlahtotal = jumlahtotal - 30000;
    }
  }

  functionTambahJumlah5() {
    jumlah5++;
    jumlahtotal = jumlahtotal + 30000;
  }

  functionKurangJumlah6() {
    if (jumlah6 < 1) {
    } else {
      jumlah6--;
      jumlahtotal = jumlahtotal - 35000;
    }
  }

  functionTambahJumlah6() {
    jumlah6++;
    jumlahtotal = jumlahtotal + 35000;
  }

  functionKurangJumlah7() {
    if (jumlah7 < 1) {
    } else {
      jumlah7--;
      jumlahtotal = jumlahtotal - 40000;
    }
  }

  functionTambahJumlah7() {
    jumlah7++;
    jumlahtotal = jumlahtotal + 40000;
  }

  functionKurangJumlah8() {
    if (jumlah8 < 1) {
    } else {
      jumlah8--;
      jumlahtotal = jumlahtotal - 45000;
    }
  }

  functionTambahJumlah8() {
    jumlah8++;
    jumlahtotal = jumlahtotal + 45000;
  }

  // void functionValidate() {

  // }

  Future addOrders() async {
    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore.instance.collection('orders').doc().set({
      "userid": user.uid,
      "username": validnama.text,
      "email": validemail.text,
      "telp": validtelp.text,
      // 'items':
      "jumlah1": jumlah1.toString(),
      "jumlah2": jumlah2.toString(),
      "jumlah3": jumlah3.toString(),
      "jumlah4": jumlah4.toString(),
      "jumlah5": jumlah5.toString(),
      "jumlah6": jumlah6.toString(),
      "jumlah7": jumlah7.toString(),
      "jumlah8": jumlah8.toString(),
      "jumlahtotal": jumlahtotal.toString(),
    });

    // final Map<String, String> json = {
    // "userid": user.uid,
    // "username": validnama.text,
    // "email": validemail.text,
    // "telp": validtelp.text,
    // // 'items':
    // "jumlah1": jumlah1.toString(),
    // "jumlah2": jumlah2.toString(),
    // "jumlah3": jumlah3.toString(),
    // "jumlah4": jumlah4.toString(),
    // "jumlah5": jumlah5.toString(),
    // "jumlah6": jumlah6.toString(),
    // "jumlah7": jumlah7.toString(),
    // "jumlah8": jumlah8.toString(),
    // "jumlahtotal": jumlahtotal.toString(),
    // };

    // final docUser =
    //     FirebaseFirestore.instance.collection('orders').doc().set(json);

    // await docUser.set(json);

    //   {
    //   'username': mc.validnama,
    //   'email': mc.validemail,
    //   // 'telp': telp,
    //   // 'jumlah1': jumlah1,
    //   // 'jumlah2': jumlah2,
    //   // 'jumlah3': jumlah3,
    //   // 'jumlah4': jumlah4,
    //   // 'jumlah5': jumlah5,
    //   // 'jumlah6': jumlah6,
    //   // 'jumlah7': jumlah7,
    //   // 'jumlah8': jumlah8,
    //   // 'jumlahtotal': jumlahtotal,
    // }
  }

  functionSendEmail(namaToko, message) async {
    const url = 'https://api.emailjs.com/api/v1.0/email/send';
    const serviceId = 'service_nv0prhu';
    const templateId = 'template_0y9ec3i';
    const userId = 'ZZ33N77wb3Yq8G8W0';

    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': namaToko,
            'from_email': validemail.text,
            'to_name': validnama.text,
            'message': message
          }
        }));
    print(namaToko);
    print(validemail.text);
    print(message);

    print(response.statusCode);
    print(response.body);
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    print('object');
    // Get.to(AuthPage());
  }

  Future<List<dynamic>> getDocId() async {
    final user = FirebaseAuth.instance.currentUser!;

    var snapshot = await FirebaseFirestore.instance.collection('orders').get();
    listOrders.clear();
    for (final item in snapshot.docs) {
      if (item.data()['userid'] == user.uid) {
        listOrders.add(item.data());

        // print('ada');
        // print(item.data()['userid']);
      }
    }
    //print('dor');
    print(listOrders);

    return listOrders;
    // .catchError((e) => print("error fetching data: $e"));
  }

  // void SendEmail(String s, String value, String value2, String t) {}

  // functionsendEmail(){
  //   RxString(name.value);
  //   RxString(toNAme.value);
  //   RxString(email.value);
  //   RxString(message.value);

  //   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  //   const serviceId = 'service_nv0prhu';
  //   const templateId = 'template_0y9ec3i';
  //   const userId = 'ZZ33N77wb3Yq8G8W0';
  //   final response = await http.post(url,
  //       headers: {
  //         'Content-Type': 'application/json'
  //       }, //This line makes sure it works for all platforms.
  //       body: json.encode({
  //         'service_id': serviceId,
  //         'template_id': templateId,
  //         'user_id': userId,
  //         'template_params': {
  //           'from_name': name,
  //           'from_email': email,
  //           'to_name': toName,
  //           'message': message
  //   }
  //   ))
  // }
}
