import 'package:e_apotek/feature/api/api_execption.dart';
import 'package:e_apotek/feature/api/api_url.dart';
import 'package:e_apotek/feature/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

ApiUrl apiUrl = ApiUrl();

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final response = await http.get(Uri.parse(apiUrl.products));
        if (response.statusCode == 200) {
          emit(ProductSuccess(product: productFromMap(response.body)));
        } else {
          emit(ProductError(
              apiExeception: ApiExeception(
                  code: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(ProductError(
            apiExeception: ApiExeception(code: 500, message: e.toString())));
      }
    });

    on<PostProductEvent>((event, emit) async {
      try {
        emit(ProductPostLoading());
        final request = http.MultipartRequest(
            'POST', Uri.parse(apiUrl.productFind(event.dataId)));

        if (event.body!['thumbnail'] != null) {
          request.files.add(await http.MultipartFile.fromPath(
              'thumbnail', event.body!['thumbnail'].path));
        }
        request.fields['kode_produk'] = event.body!['kode_produk'];
        request.fields['nama_produk'] = event.body!['nama_produk'];
        request.fields['harga'] = event.body!['harga'];
        request.fields['description'] = event.body!['description'];

        final streamResponse = await request.send();
        final response = await http.Response.fromStream(streamResponse);

        if (response.statusCode == 200) {
          emit(ProductPostSuccess());
        } else {
          emit(ProductPostError(
              apiExeception: ApiExeception(
                  code: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(ProductPostError(
            apiExeception: ApiExeception(code: 500, message: e.toString())));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        emit(ProductDeleteLoading());

        final response =
            await http.delete(Uri.parse(apiUrl.productFind(event.dataId)));

        if (response.statusCode == 200) {
          emit(ProductDeleteSuccess());
        } else {
          emit(ProductDeleteError(
              apiExeception: ApiExeception(
                  code: response.statusCode, message: response.body)));
        }
      } catch (e) {
        emit(ProductDeleteError(
            apiExeception: ApiExeception(code: 500, message: e.toString())));
      }
    });
  }
}
