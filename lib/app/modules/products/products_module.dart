import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_store/app/core/dio_cliient/dio/dio_client_service_impl.dart';
import 'package:new_store/app/core/routes/app_routes.dart';
import 'package:new_store/app/core/services/service_locator_service.dart';
import 'package:new_store/app/core/services/shared_preferences_service.dart';
import 'package:new_store/app/modules/products/data/datasources/impl/products_datasource_impl.dart';
import 'package:new_store/app/modules/products/data/repositories/products_repository_impl.dart';
import 'package:new_store/app/modules/products/domain/usecases/get_products_usecase.dart';
import 'package:new_store/app/modules/products/presenter/controllers/products_page_controller.dart';
import 'package:new_store/app/modules/products/presenter/pages/favorites_page.dart';
import 'package:new_store/app/modules/products/presenter/pages/product_details_page.dart';
import 'package:new_store/app/modules/products/presenter/pages/products_page.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => ProductsPageController(
        getProductsUsecase: i(),
        sharedPreferencesService: i(),
      ),
    ),
    Bind.factory(
      (i) => SharedPreferencesService(),
    ),
    Bind.factory(
      (i) => GetProductsUsecaseImpl(
        productsRepositoy: i(),
      ),
    ),
    Bind.factory(
      (i) => ProductsRepositoryImpl(
        productsDatasource: i(),
      ),
    ),
    Bind.factory(
      (i) => ProductsDatasourceImpl(
        dioService: i(),
      ),
    ),
    Bind.factory(
      (i) => DioClientServiceImpl(
        dio: i(),
      ),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => ProductsPage(
            productsPageController:
                ServiceLocatorService.dependency<ProductsPageController>(),
          ),
        ),
        ChildRoute(
          AppRoutes.productDetailsRoute,
          child: (context, args) => ProductDetailsPage(
            id: args.data['id'],
            image: args.data['image'],
            category: args.data['category'],
            description: args.data['description'],
            price: args.data['price'],
            rating: args.data['rating'],
            title: args.data['title'],
            isFavorite: args.data['isFavorite'],
          ),
        ),
        ChildRoute(
          AppRoutes.favoritesPageRoute,
          child: (context, args) => FavoritesPage(
            favoriteProducts: args.data['favoriteProducts'],
            productsPageController: args.data['productsPageController'],
          ),
        ),
      ];
}
