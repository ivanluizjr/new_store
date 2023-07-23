import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_store/app/core/services/config/environment.dart';

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
  List<ModularRoute> routes = [];
}
