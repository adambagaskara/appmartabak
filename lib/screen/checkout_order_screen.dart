import 'package:appmartabak/screen/noti.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../controller/martabak_c.dart';
import 'input_order_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'noti.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class CheckoutOrderScreen extends StatefulWidget {
  CheckoutOrderScreen({super.key});

  @override
  State<CheckoutOrderScreen> createState() => _CheckoutOrderScreenState();
}

class _CheckoutOrderScreenState extends State<CheckoutOrderScreen> {
  final mc = Get.find<MartabakC>();

  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesanan Anda')),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 25),
            child: Text(
                textAlign: TextAlign.center,
                style: GoogleFonts.creepster().copyWith(fontSize: 30),
                'Detail Pesanan Anda'),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 30),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Nama: '),
              Text(mc.validnama.text)
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'e-mail: '),
              Text(mc.validemail.text)
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Nomer Telepon: '),
              Text(mc.validtelp.text)
            ]),
          ),
          //if
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(
                  style: GoogleFonts.overpassMono(), 'Jumlah Martabak Manis: '),
              Text(mc.jumlah1.toString()),
              Text(' x Rp. 10. 000'),
            ]),
          ),
          //if
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(
                  style: GoogleFonts.overpassMono(), 'Jumlah Martabak Telur: '),
              Text(mc.jumlah2.toString()),
              Text(' x Rp. 15. 000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(
                  style: GoogleFonts.overpassMono(),
                  'Jumlah Martabak Kering: '),
              Text(mc.jumlah3.toString()),
              Text(' x Rp. 20.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Jumlah Martabak Mini: '),
              Text(mc.jumlah4.toString()),
              Text(' x Rp. 25.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Jumlah Martabak Abon: '),
              Text(mc.jumlah5.toString()),
              Text(' x Rp. 30.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(
                  style: GoogleFonts.overpassMono(), 'Jumlah Martabak Pizza: '),
              Text(mc.jumlah6.toString()),
              Text(' x Rp. 35.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(
                  style: GoogleFonts.overpassMono(), 'Jumlah Martabak Tipis: '),
              Text(mc.jumlah7.toString()),
              Text(' x Rp. 40.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Jumlah Martabak Teri: '),
              Text(mc.jumlah8.toString()),
              Text(' x Rp. 45.000'),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 30, left: 30, right: 0, top: 10),
            child: Row(children: [
              Text(style: GoogleFonts.overpassMono(), 'Total Harga: Rp. '),
              Text(mc.jumlahtotal.toString())
            ]),
          ),
          ElevatedButton(
              onPressed: () {
                mc.addOrders();

                // mc.getDocId();

                mc.functionSendEmail('Martabak Cinere 69',
                    'Martabak Manis: ${mc.jumlah1.value} x Rp. 10.000 \n Martabak Telur: ${mc.jumlah2.value} x Rp. 15.000 \n Martabak Kering: ${mc.jumlah3.value} x Rp. 20.000 \n Martabak Mini: ${mc.jumlah4.value} x Rp. 25.000 \n Martabak Abon: ${mc.jumlah5.value} x Rp. 30.000 \n Martabak Pizza: ${mc.jumlah6.value} x Rp. 35.000 \n Martabak Tipis: ${mc.jumlah7.value} x Rp. 40.000 \n Martabak Teri: ${mc.jumlah8.value} x Rp. 45.000 \n Total Harga: Rp. ${mc.jumlahtotal}');

                Noti.showBigTextNotification(0, "Martabak Cinere 69",
                    "Waw! Pesananmu berhasil!", "0", context);
                // id: "0",
                //   "Martabak Cinere 69",
                //   body: "Waw! Pesananmu berhasil!",
                //   fln: flutterLocalNotificationsPlugin);
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text("Selamat! Pesanan Anda sudah kami terima!")));

                Future.delayed(const Duration(milliseconds: 500), () {
                  mc.getDocId();
                  print('500 ms has passed.'); // Prints after 1 second.
                });
              },
              child: Text('Pesan'))
        ],
      ),
    );
  }
}
