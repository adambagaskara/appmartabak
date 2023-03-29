import 'package:appmartabak/controller/martabak_c.dart';
import 'package:appmartabak/screen/checkout_order_screen.dart';
import 'package:appmartabak/screen/itemmartabak.dart';
import 'package:appmartabak/screen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';

class InputOrder extends StatelessWidget {
  final mc = Get.put(MartabakC());
  InputOrder({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  mc.getDocId();
                  Get.to(() => MainScreen());
                },
              );
            },
          ),
          title: Text('Form Pemesanan')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mc.validnama,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Wajib Diisi';
                    }
                    return null;
                  },
                  // onChanged: (String str) {
                  //   mc.namaPembeli.value = str;
                  // },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nama Anda'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mc.validemail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Wajib Diisi';
                    }
                    return null;
                  },
                  // onChanged: (String str2) {
                  //   mc.email.value = str2;
                  // },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'e-mail'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mc.validtelp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Wajib Diisi';
                    }
                    return null;
                  },
                  // onChanged: (String str3) {
                  //   mc.telp.value = str3;
                  // },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nomer ajah'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text('\n Pesanan'),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 18, right: 10, top: 10),
                child: Column(
                  children: [
                    ItemMartabak(
                      gambar:
                          'https://img.okezone.com/content/2021/08/07/298/2452497/martabak-jadi-makanan-paling-banyak-dipesan-online-selama-pandemi-RlgqSfPagt.jpeg',
                      nama: 'Martabak Manis',
                      harga: '10.000',
                      jumlah: mc.jumlah1,
                      functionMinus: () {
                        mc.functionKurangJumlah1();
                      },
                      functionPlus: () {
                        mc.functionTambahJumlah1();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, left: 25, right: 25, top: 10),
                child: ItemMartabak(
                  gambar:
                      'https://cdn0-production-images-kly.akamaized.net/P3ea3CGJNVboo3jgSh_x6G77LWk=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2552022/original/027429600_1545215105-cara-membuat-martabak-telur.jpg',
                  nama: 'Martabak Telur',
                  harga: '15.000',
                  jumlah: mc.jumlah2,
                  functionMinus: () {
                    mc.functionKurangJumlah2();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah2();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'https://kbu-cdn.com/dk/wp-content/uploads/martabak-8-rasa.jpg',
                  nama: 'Martabak Kering',
                  harga: '20.000',
                  jumlah: mc.jumlah3,
                  functionMinus: () {
                    mc.functionKurangJumlah3();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah3();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'https://img-global.cpcdn.com/recipes/dcd9c236c291139f/1200x630cq70/photo.jpg',
                  nama: 'Martabak Mini   ',
                  harga: '25.000    ',
                  jumlah: mc.jumlah4,
                  functionMinus: () {
                    mc.functionKurangJumlah4();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah4();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'https://img-global.cpcdn.com/recipes/002822678367536d/1200x630cq70/photo.jpg',
                  nama: 'Martabak Abon ',
                  harga: '30.000  ',
                  jumlah: mc.jumlah5,
                  functionMinus: () {
                    mc.functionKurangJumlah5();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah5();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'http://www.jurnalasia.com/wp-content/uploads/2016/09/Martabak-Pit-Stop-8.jpg',
                  nama: 'Martabak Pizza',
                  harga: '35.000',
                  jumlah: mc.jumlah6,
                  functionMinus: () {
                    mc.functionKurangJumlah6();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah6();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'https://jatenglive.com/images/news/Main-ke-Solo--Wajib-Cobain-Martabak-Tipis-Kering-di-Martabak-Top-Bandung-BEN--news20180418-martabak_20180301_234340.jpg',
                  nama: 'Martabak Tipis ',
                  harga: '40.000 ',
                  jumlah: mc.jumlah7,
                  functionMinus: () {
                    mc.functionKurangJumlah7();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah7();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 17, right: 10, top: 8),
                child: ItemMartabak(
                  gambar:
                      'https://www.langsungenak.com/wp-content/uploads/2020/11/Martabak-telur-istimewa-Cukup-pakai-teflon-by-Fitriatul-Muniroh.jpg',
                  nama: 'Martabak Teri   ',
                  harga: '45.000   ',
                  jumlah: mc.jumlah8,
                  functionMinus: () {
                    mc.functionKurangJumlah8();
                  },
                  functionPlus: () {
                    mc.functionTambahJumlah8();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 180, right: 0, top: 30),
                child: Column(
                  children: [
                    Text('Total:'),
                    Obx(() => Text(mc.jumlahtotal.value.toString()))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, left: 180, right: 0, top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (mc.jumlah1.value > 0 ||
                            mc.jumlah2.value > 0 ||
                            mc.jumlah3.value > 0) {
                          Get.to(() => CheckoutOrderScreen());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Anda Belum Memesan Martabak!")));
                        }
                      }
                    },
                    child: Text('Pesan')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
