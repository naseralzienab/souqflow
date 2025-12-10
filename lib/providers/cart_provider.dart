import 'package:flutter/material.dart';
import 'package:souqflow/providers/products_provider.dart';

class CartItem {
  final String id;
  final String productId;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((item) {
      total = total + item.price * item.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    final existingIndex = _items.indexWhere(
      (item) => item.productId == product.id,
    );
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartItem(
          id: DateTime.now().toString(),
          productId: product.id,
          name: product.name,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}
