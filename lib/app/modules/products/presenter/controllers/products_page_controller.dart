import 'package:flutter/material.dart';
import 'package:new_store/app/core/services/reactive_service.dart';
import 'package:new_store/app/core/services/snack_bar_service.dart';
import 'package:new_store/app/modules/products/domain/entities/products_entity.dart';
import 'package:new_store/app/modules/products/domain/usecases/get_products_usecase.dart';
import 'package:new_store/app/modules/products/presenter/controllers/states/products_page_state.dart';

class ProductsPageController extends ReactiveServiceImpl<IProductsPageState> {
  final IGetProductsUsecase getProductsUsecase;

  ProductsPageController({
    required this.getProductsUsecase,
  }) : super(ProductPageInitialState());

  List<ProductsEntity> listProductsEntity = List<ProductsEntity>.empty();
  List<String> productNames = [];
  ProductsEntity singleProductEntity = ProductsEntity.empty();

  Future<void> getProducts() async {
    emit(ProductPageLoadingState());

    final response = await getProductsUsecase(
      productsEntity: listProductsEntity,
    );

    response.fold(
      (error) {
        emit(
          ProducPageFailureState(
            message: error.message,
            stackTrace: error.stackTrace,
          ),
        );
      },
      (success) {
        listProductsEntity = success;
        productNames = success.map((e) => e.title).toList();
        emit(
          ProductPageSuccessState(listProducts: listProductsEntity),
        );
      },
    );
  }

  void filterProduct(
    String searchQuery,
    BuildContext context,
  ) {
    searchQuery = searchQuery.toLowerCase();

    listProductsEntity = listProductsEntity.where((product) {
      return product.title.toLowerCase().startsWith(searchQuery);
    }).toList();

    if (listProductsEntity.isNotEmpty) {
      singleProductEntity = listProductsEntity[0];
      emit(
        ProductPageSuccessState(listProducts: listProductsEntity),
      );
    } else {
      SnackBarService.showError(
          context: context,
          message: 'Nenhum produto encontrado com o nome $searchQuery');
    }
  }
}
