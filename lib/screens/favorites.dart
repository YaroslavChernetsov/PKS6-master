import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favorites;
  final Function(Product) onAddToCart;

  FavoritesScreen({
    required this.favorites,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text('Нет избранных товаров'),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        var product = favorites[index];
        return ProductCard(
          product: product,
          isFavorite: true,
          onFavoriteToggle: (_) {},
          onAddToCart: onAddToCart,
        );
      },
    );
  }
}
