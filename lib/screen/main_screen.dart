import 'package:appmartabak/controller/martabak_c.dart';
import 'package:appmartabak/screen/get_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_order_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final mc = Get.put(MartabakC());
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List docIDs = [];
  List listOrders = [];

  //get docIDs

  // Future getDocId() async {
  //   await FirebaseFirestore.instance.collection('orders').get().then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print(user.uid);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: mc.signUserOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  style: GoogleFonts.sora(),
                  'Selamat Datang di Aplikasi Pemesanan Martabak \n'),
              Text(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p().copyWith(fontSize: 25),
                  'Cinere 69 \n'),
              Text(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.shareTech().copyWith(fontSize: 20),
                  'Wahai, ' + user.email!),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    Get.to(InputOrder());
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => InputOrder()));
                  },
                  child: Text('Pesan Disini')),
              const SizedBox(height: 30),
              Container(
                color: Colors.black45,
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.shareTech().copyWith(fontSize: 20),
                      'Riwayat Pesanan Anda'),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: FutureBuilder(
                    future: mc.getDocId(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data?[index];
                          return ListTile(
                            // title: GetOrderName(documendId: data?['email']),
                            title: Text(
                                'Username: ${data?['username']} \n E-Mail: ${data?['email']} \n Telp: ${data?['telp']} \n Martabak Manis: ${data?['jumlah1']} \n Martabak Telur: ${data?['jumlah2']} \n Martabak Kering: ${data?['jumlah3']} \n Martabak Mini: ${data?['jumlah4']} \n Martabak Abon: ${data?['jumlah5']} \n Martabak Pizza: ${data?['jumlah6']} \n Martabak Tipis: ${data?['jumlah7']} \n Martabak Teri: ${data?['jumlah8']} \n Total Harga: Rp. ${data?['jumlahtotal']}'),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
