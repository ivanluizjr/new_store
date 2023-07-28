import 'package:flutter/material.dart';
import 'package:new_store/app/core/services/reactive_service.dart';
import 'package:new_store/app/core/services/shared_preferences_service.dart';
import 'package:new_store/app/core/services/snack_bar_service.dart';
import 'package:new_store/app/modules/products/domain/entities/products_entity.dart';
import 'package:new_store/app/modules/products/domain/usecases/get_products_usecase.dart';
import 'package:new_store/app/modules/products/presenter/controllers/states/products_page_state.dart';

class ProductsPageController extends ReactiveServiceImpl<IProductsPageState> {
  final IGetProductsUsecase getProductsUsecase;
  final SharedPreferencesService sharedPreferencesService;

  ProductsPageController({
    required this.getProductsUsecase,
    required this.sharedPreferencesService,
  }) : super(ProductPageInitialState());

  List<ProductsEntity> listProductsEntity = List<ProductsEntity>.empty();
  List<String> productNames = [];
  ProductsEntity singleProductEntity = ProductsEntity.empty();

  Future<void> getProducts() async {
    emit(ProductPageLoadingState());

    final response = await getProductsUsecase(
      productsEntity: listProductsEntity,
    );

    response.fold(onLeft: (error) {
      emit(
        ProducPageFailureState(
          message: error.message,
          stackTrace: error.stackTrace,
        ),
      );
    }, onRight: (success) async {
      listProductsEntity = success;
      productNames = success.map((e) => e.title).toList();
      Map<int, bool> favoriteStatus = {};
      for (var product in listProductsEntity) {
        favoriteStatus[product.id] = await isFavoriteProduct(product);
      }
      emit(
        ProductPageSuccessState(
          listProducts: listProductsEntity,
          favoriteStatus: favoriteStatus,
        ),
      );
    });
  }

  void filterProduct(
    String searchQuery,
    BuildContext context,
  ) async {
    searchQuery = searchQuery.toLowerCase();

    listProductsEntity = listProductsEntity.where((product) {
      return product.title.toLowerCase().startsWith(searchQuery);
    }).toList();

    if (listProductsEntity.isNotEmpty) {
      singleProductEntity = listProductsEntity[0];
      Map<int, bool> favoriteStatus = {};
      for (var product in listProductsEntity) {
        favoriteStatus[product.id] = await isFavoriteProduct(product);
      }

      emit(
        ProductPageSuccessState(
          listProducts: listProductsEntity,
          favoriteStatus: favoriteStatus,
        ),
      );
    } else {
      SnackBarService.showError(
          context: context,
          message: 'Nenhum produto encontrado com o nome $searchQuery');
    }
  }

  Future<void> toggleFavoriteProduct(ProductsEntity product) async {
    final favoriteProducts =
        await sharedPreferencesService.getFavoriteProducts();
    if (favoriteProducts.contains(
      product.id.toString(),
    )) {
      await sharedPreferencesService.removeFavoriteProduct(
        product.id.toString(),
      );
    } else {
      await sharedPreferencesService.addFavoriteProduct(
        product.id.toString(),
      );
    }
    Map<int, bool> favoriteStatus = {...value.favoriteStatus};
    favoriteStatus[product.id] = await isFavoriteProduct(product);
    emit(
      ProductPageSuccessState(
        listProducts: listProductsEntity,
        favoriteStatus: favoriteStatus,
      ),
    );
  }

  Future<bool> isFavoriteProduct(ProductsEntity product) async {
    final favoriteProducts =
        await sharedPreferencesService.getFavoriteProducts();
    return favoriteProducts.contains(
      product.id.toString(),
    );
  }

  Future<List<ProductsEntity>> getFavoriteProducts() async {
    List<ProductsEntity> favorites = [];
    for (var product in listProductsEntity) {
      if (await isFavoriteProduct(product)) {
        favorites.add(product);
      }
    }
    return favorites;
  }

  void dispose() {}
}
