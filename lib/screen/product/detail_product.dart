import 'package:e_apotek/helpers/currency_format.dart';
import 'package:e_apotek/screen/product/form_product.dart';
import 'package:e_apotek/screen/product/list_product.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String? title;
  final String? thumbnail;
  final int? harga;
  final int? tag;

  const DetailProduct(
      {super.key, this.title, this.thumbnail, this.harga, this.tag});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(62, 0, 0, 0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListProduct()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Hero(
                    tag: '$tag',
                    child: Image.asset(
                      'assets/img/img-placeholder.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$title',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(CurrencyFormat.convertToIdr(3000, 0),
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Deskripsi Produk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'ALBENDAZOLE 400 MG TABLET merupakan obat generik dengan kandungan Albendazole. Albendazole adalah obat cacing derivat benzimidazol berspektrum luas. Albendazole bekerja dengan cara merusak sel di usus cacing, sehingga cacing tidak dapat menyerap gula, serta kehabisan energi dan mati.',
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FloatingActionButton(
                          heroTag: 'hapus',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: Colors.red,
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Hapus',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FloatingActionButton(
                          heroTag: 'edit',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: const Color(0xFF58BDBD),
                          onPressed: () {
                            debugPrint('trigereedd');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FormProduct()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.edit_square,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
