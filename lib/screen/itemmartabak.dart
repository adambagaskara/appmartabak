import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemMartabak extends StatelessWidget {
  var gambar;
  var nama;
  var harga;
  RxInt jumlah;
  var functionMinus;
  var functionPlus;

  ItemMartabak(
      {super.key,
      this.gambar,
      this.nama,
      this.harga,
      required this.jumlah,
      this.functionMinus,
      this.functionPlus});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          gambar,
          width: 100,
        ),
        Column(
          children: [Text(nama), Text(harga)],
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: ElevatedButton(onPressed: functionMinus, child: Text('-')),
        ),
        Obx(() => Text(
              jumlah.toString(),
              style: TextStyle(fontSize: 30),
            )),
        Padding(
          padding: const EdgeInsets.all(0.8),
          child: ElevatedButton(onPressed: functionPlus, child: Text('+')),
        )
      ],
    );
  }
}
