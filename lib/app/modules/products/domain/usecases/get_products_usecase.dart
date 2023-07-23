import 'package:new_store/app/core/either.dart';
import 'package:new_store/app/modules/products/domain/entities/products_entity.dart';
import 'package:new_store/app/modules/products/domain/failures/products_failure.dart';
import 'package:new_store/app/modules/products/domain/repositories/products_repository.dart';

abstract class IGetProductsUsecase {
  Future<Either<IProductsFailure, List<ProductsEntity>>> call();
}

class GetProductsUsecase implements IGetProductsUsecase {
  final IProductsRepository productsRepositoy;

  GetProductsUsecase({required this.productsRepositoy});

  @override
  Future<Either<IProductsFailure, List<ProductsEntity>>> call() async {
    final response = await productsRepositoy.getProducts();

    return response;
  }
}
