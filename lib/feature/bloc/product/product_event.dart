part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {}

class PostProductEvent extends ProductEvent {
  int? dataId;
  Map<String, dynamic>? body;

  PostProductEvent({required this.body, this.dataId});
}
