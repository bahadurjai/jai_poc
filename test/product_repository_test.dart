import 'package:flutter_test/flutter_test.dart';
import 'package:jai_poc/features/home/data/repositories/product_repository.dart';
import 'package:jai_poc/features/home/domain/entities/product.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {

  MockProductRepository mockLeadRepository = MockProductRepository();
  var banerImages = [
    "https://i.dummyjson.com/data/products/1/1.jpg",
    "https://i.dummyjson.com/data/products/1/2.jpg",
    "https://i.dummyjson.com/data/products/1/3.jpg",
    "https://i.dummyjson.com/data/products/1/4.jpg",
    "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
  ];
  final List<Product> tProductList = [
    Product(
      title: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple',
      price: "549",
      imageUrl: 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
      images: banerImages,
    )
  ];

  test('should return a list of products with success when status code is 200',
      () async {
    // arrange
    when(() => mockLeadRepository.fetchProducts())
        .thenAnswer((_) async => Future.value(tProductList));
    // act
    final result = await mockLeadRepository.fetchProducts();
    // assert
    expect(result, equals(tProductList));
  });
}
