class ApiUrl {
  ApiUrl();

  String baseUrl = 'http://192.168.0.107/ci4-api-apotek/public';

// product
  late String products = '$baseUrl/produk';
  late String productFindOne = '$baseUrl/product';

  String productFind(int? dataId) {
    return dataId != null ? '$products/$dataId' : products;
  }

// auth

  late String register = '$baseUrl/registrasi';
  late String login = '$baseUrl/login';
}
