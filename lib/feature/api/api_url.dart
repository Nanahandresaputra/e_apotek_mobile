import 'dart:convert';

class ApiUrl {
  final int? dataId;

  ApiUrl({this.dataId});

  String baseUrl = 'http://localhost/ci4-api-apotek/public';

  late String products = '$base64Url/produk';
  late String productFindOne = '$base64Url/product/$dataId';
}
