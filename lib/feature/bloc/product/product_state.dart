part of 'product_bloc.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<Product>? product;
  ProductSuccess({required this.product});
}

final class ProductError extends ProductState {
  final ApiExeception? apiExeception;

  ProductError({required this.apiExeception});
}
