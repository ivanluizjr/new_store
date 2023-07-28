import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_store/app/core/routes/app_routes.dart';
import 'package:new_store/app/core/services/config/environment.dart';
import 'package:new_store/app/modules/products/products_module.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory(
      (i) => Dio(
        BaseOptions(
          baseUrl: Environment().config.apiHost,
        ),
      ),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.initialRoute,
          module: ProductsModule(),
        ),
      ];
}
