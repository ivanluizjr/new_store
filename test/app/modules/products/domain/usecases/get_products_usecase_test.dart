import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:new_store/app/core/either.dart';
import 'package:new_store/app/modules/products/domain/entities/products_entity.dart';
import 'package:new_store/app/modules/products/domain/failures/products_failure.dart';
import 'package:new_store/app/modules/products/domain/repositories/products_repository.dart';
import 'package:new_store/app/modules/products/domain/usecases/get_products_usecase.dart';

class MockIProductsRepository extends Mock implements IProductsRepository {}

void main() {
  late GetProductsUsecase getProductsUsecase;
  late IProductsRepository productsRepository;

  setUp(() {
    productsRepository = MockIProductsRepository();
    getProductsUsecase =
        GetProductsUsecase(productsRepositoy: productsRepository);
  });

  group('GetProductsUsecase', () {
    test('retorna lista de produtos quando a chamada é bem sucedida', () async {
      // Arrange
      final products = [
        ProductsEntity(
            id: 1,
            title: "Product 1",
            price: 10.0,
            description: "Description 1",
            category: "Category 1",
            image: "Image 1",
            rating: Rating(rate: 4.0, count: 10)),
        ProductsEntity(
            id: 2,
            title: "Product 2",
            price: 20.0,
            description: "Description 2",
            category: "Category 2",
            image: "Image 2",
            rating: Rating(rate: 4.5, count: 20)),
      ];
      when(() => productsRepository.getProducts())
          .thenAnswer((_) async => Right(products));

      // Act
      final result = await getProductsUsecase();

      // Assert
      expect(result, isA<Right<IProductsFailure, List<ProductsEntity>>>());
      verify(() => productsRepository.getProducts()).called(1);
    });

    test('retorna falha quando a chamada falha', () async {
      // Arrange
      final failure = ProductsFailure(message: 'Erro ao retornar chamada');
      when(() => productsRepository.getProducts())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getProductsUsecase();

      // Assert
      expect(result, isA<Left<IProductsFailure, List<ProductsEntity>>>());
      verify(() => productsRepository.getProducts()).called(1);
    });
  });
}
