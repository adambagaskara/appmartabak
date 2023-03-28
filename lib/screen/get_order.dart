import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetOrderName extends StatelessWidget {
  final String documendId;

  GetOrderName({required this.documendId});

  @override
  Widget build(BuildContext context) {
    //get the collection

    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');

    return FutureBuilder<DocumentSnapshot>(
      future: orders.doc(documendId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
              'Username: ${data['username']} \n E-Mail: ${data['email']} \n Telp: ${data['telp']} \n Martabak Manis: ${data['jumlah1']} \n Martabak Telur: ${data['jumlah2']} \n Martabak Kering: ${data['jumlah3']} \n Martabak Mini: ${data['jumlah4']} \n Martabak Abon: ${data['jumlah5']} \n Martabak Pizza: ${data['jumlah6']} \n Martabak Tipis: ${data['jumlah7']} \n Martabak Teri: ${data['jumlah8']} \n Total Harga: Rp. ${data['jumlahtotal']}');
        }
        return Text('Loading...');
      }),
    );
  }
}
