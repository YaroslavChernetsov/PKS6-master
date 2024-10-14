import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final List<Product> favorites;
  final Function(Product) onFavoriteToggle;
  final Function(Product) onAddToCart;

  ProductGrid({
    required this.products,
    required this.favorites,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        bool isFavorite = favorites.contains(product);
        return ProductCard(
          product: product,
          isFavorite: isFavorite,
          onFavoriteToggle: onFavoriteToggle,
          onAddToCart: onAddToCart,
        );
      },
    );
  }
}
