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
      emit(ProductLoading());
      final response = await http.get(Uri.parse(apiUrl.products));
      if (response.statusCode == 200) {
        emit(ProductSuccess(product: productFromMap(response.body)));
      } else {
        emit(ProductError(
            apiExeception: ApiExeception(
                code: response.statusCode, message: response.body)));
      }
    });

    on<PostProductEvent>((event, emit) async {
      emit(ProductPostLoading());
      final response = await http
          .post(Uri.parse(apiUrl.productPost(event.dataId)), body: event.body);
      if (response.statusCode == 200) {
        emit(ProductPostSuccess());
      } else {
        emit(ProductPostError(
            apiExeception: ApiExeception(
                code: response.statusCode, message: response.body)));
      }
    });
  }
}
