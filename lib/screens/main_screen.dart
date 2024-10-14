import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_grid.dart';
import 'favorites.dart';
import 'cart.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Product> _favorites = [];
  List<Product> _cart = [];
  double _totalPrice = 0.0;

  List<Product> products = [
    Product(name: "Dark Souls 3", price: 500, image: 'assets/product1.jpg'),
    Product(name: "Doom", price: 1500, image: 'assets/product2.jpg'),
    Product(name: "Far Cry 5", price: 800, image: 'assets/product3.jpg'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToFavorites(Product product) {
    setState(() {
      if (_favorites.contains(product)) {
        _favorites.remove(product);
      } else {
        _favorites.add(product);
      }
    });
  }

  void _addToCart(Product product) {
    setState(() {
      if (!_cart.contains(product)) {
        _cart.add(product);
        _calculateTotalPrice();
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      _cart.remove(product);
      _calculateTotalPrice();
    });
  }

  void _calculateTotalPrice() {
    _totalPrice = _cart.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      ProductGrid(
        products: products,
        favorites: _favorites,
        onFavoriteToggle: _addToFavorites,
        onAddToCart: _addToCart,
      ),
      FavoritesScreen(
        favorites: _favorites,
        onAddToCart: _addToCart,
      ),
      CartScreen(
        cart: _cart,
        totalPrice: _totalPrice,
        onRemoveFromCart: _removeFromCart,
      ),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Epic Magaz')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
