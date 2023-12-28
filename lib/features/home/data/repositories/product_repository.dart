import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jai_poc/features/home/domain/entities/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    print(response);
    if (response.statusCode == 200) {
      try {
        final jsonList = json.decode(response.body);
        return jsonList['products'] != null
            ? List<Product>.from(
                jsonList['products']
                    .map((product) => Product.fromJson(product)),
              )
            : [];
      } catch (e) {
        print(e.toString());
        return [];
      }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
