class ApiUrl {
  final int? dataId;

  ApiUrl({this.dataId});

  String baseUrl = 'http://192.168.50.232/ci4-api-apotek/public';

// product
  late String products = '$baseUrl/produk';
  late String productFindOne = '$baseUrl/product/$dataId';

// auth

  late String register = '$baseUrl/registrasi';
  late String login = '$baseUrl/login';
}
