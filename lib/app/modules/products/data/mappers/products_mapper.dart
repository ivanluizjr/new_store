import 'package:new_store/app/modules/products/domain/entities/products_entity.dart';

class ProductsMapper {
  static ProductsEntity fromMap(Map<String, dynamic> map) {
    return ProductsEntity(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: Rating.fromMap(
        map['rating'],
      ),
    );
  }
}

Map<String, dynamic> toMap(ProductsEntity productsEntity) {
  return {
    'id': productsEntity.id,
    'title': productsEntity.title,
    'price': productsEntity.price,
    'description': productsEntity.description,
    'category': productsEntity.category,
    'image': productsEntity.image,
    'rating': productsEntity.rating.toMap(),
  };
}
