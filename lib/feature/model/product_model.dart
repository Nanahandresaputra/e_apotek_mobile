// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

List<Product> productFromMap(String str) =>
    List<Product>.from(json.decode(str)['data'].map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
  final String? id;
  final String? kodeProduk;
  final String? namaProduk;
  final String? harga;
  final String? description;
  final String? thumbnail;
  final String? thumbnailUrl;

  Product({
    this.id,
    this.kodeProduk,
    this.namaProduk,
    this.harga,
    this.description,
    this.thumbnail,
    this.thumbnailUrl,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        kodeProduk: json["kode_produk"],
        namaProduk: json["nama_produk"],
        harga: json["harga"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        thumbnailUrl: json["thumbnail_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "kode_produk": kodeProduk,
        "nama_produk": namaProduk,
        "harga": harga,
        "description": description,
        "thumbnail": thumbnail,
        "thumbnail_url": thumbnailUrl,
      };
}
