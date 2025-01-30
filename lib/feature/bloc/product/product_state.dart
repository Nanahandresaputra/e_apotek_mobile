part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  List<Product>? product;
  ProductSuccess({required this.product});
}

class ProductError extends ProductState {
  ApiExeception? apiExeception;

  ProductError({required this.apiExeception});
}

class ProductPostLoading extends ProductState {}

class ProductPostSuccess extends ProductState {}

class ProductPostError extends ProductState {
  ApiExeception? apiExeception;

  ProductPostError({required this.apiExeception});
}
