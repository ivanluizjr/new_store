// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../domain/entities/products_entity.dart';

abstract class IProductsPageState {}

class ProductPageInitialState implements IProductsPageState {}

class ProductPageLoadingState implements IProductsPageState {}

class ProductPageSuccessState implements IProductsPageState {
  List<ProductsEntity> listProducts;

  ProductPageSuccessState({
    required this.listProducts,
  });
}

class ProducPageFailureState implements IProductsPageState {
  final String message;
  final StackTrace? stackTrace;

  ProducPageFailureState({
    required this.message,
    this.stackTrace,
  });
}
