import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final Function(Product) onFavoriteToggle;
  final Function(Product) onAddToCart;

  ProductCard({
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          Image.asset(
            product.image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Text(
            '${product.price} ₽',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () => onFavoriteToggle(product),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () => onAddToCart(product),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
