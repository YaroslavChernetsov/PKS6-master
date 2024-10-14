import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cart;
  final double totalPrice;
  final Function(Product) onRemoveFromCart;

  CartScreen({
    required this.cart,
    required this.totalPrice,
    required this.onRemoveFromCart,
  });

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return Center(
        child: Text('Корзина пуста'),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              var product = cart[index];
              return Dismissible(
                key: Key(product.name),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Подтверждение"),
                        content:
                            Text("Вы уверены, что хотите удалить этот товар?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text("Отмена"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text("Удалить"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (direction) {
                  onRemoveFromCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} удален из корзины'),
                    ),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('${product.price} ₽'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => onRemoveFromCart(product),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Общая сумма: $totalPrice ₽',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
