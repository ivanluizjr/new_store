import 'package:new_store/app/core/dio_cliient/dio/dio_client_service_impl.dart';
import 'package:new_store/app/core/locales/api/products_locales_api.dart';
import 'package:new_store/app/modules/products/data/datasources/products_datasource.dart';

class ProductsDatasourceImpl implements IProductsDataSource {
  final DioClientServiceImpl dioService;

  ProductsDatasourceImpl({required this.dioService});

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    final response = await dioService.get(ProductsLocalesApi.productsEndPoint);

    final data = List<Map<String, dynamic>>.from(response.data);

    return data;
  }
}
