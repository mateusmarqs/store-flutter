import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:str/models/product.dart';
import 'package:str/models/product_list.dart';
import 'package:str/widgets/products_item.dart';

class ProductGrid extends StatelessWidget {
  bool showFavoriteOnly;

  ProductGrid({super.key, required this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductItem(),
      ),
    );
  }
}
