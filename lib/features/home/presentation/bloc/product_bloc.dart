import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jai_poc/features/home/data/repositories/product_repository.dart';
import 'package:jai_poc/features/home/domain/entities/product.dart';
import 'package:jai_poc/features/home/presentation/bloc/product_event.dart';
import 'package:jai_poc/features/home/presentation/bloc/product_state.dart';
import 'package:jai_poc/core/realm/item.dart';
import 'package:jai_poc/core/realm/realm-helper.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on((event, emit) => getProductsList(emit));
  }

  void getProductsList(Emitter<ProductState> emit) async {
    try {
      // final cachedProducts = await RealmHelper.getAllProducts();

        final products = await ProductRepository().fetchProducts();
        emit(ProductLoaded(products: products));
        await RealmHelper.insertAllProduct(
            products.map((item) {
              return Item(item.title, item.description, item.imageUrl, item.price,images:item.images );
            }).toList());
        print("Added in DB");
      // }
    } catch (e) {
      emit(ProductError('Failed to load products: $e'));
    }
  }
}


