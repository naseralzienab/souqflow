import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductsProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'IPhone 15 Pro',
      description: 'Latest iPhone with A17 Pro chip and titanium design.',
      price: 999.99,
      imageUrl:
          'https://images.unsplash.com/photo-1695048133142-1a20484d2569',
    ),
    Product(
      id: '2',
      name: 'MacBook Pro M3',
      description: '16-inch MacBook Pro with M3 Max chip.',
      price: 2499.99,
      imageUrl:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
    ),
    Product(
      id: '3',
      name: 'Sony Headphones',
      description: 'Noise cancelling wireless headphones.',
      price: 299.99,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
    ),
    Product(
      id: '4',
      name: 'Nike Air Max',
      description: 'Latest Nike running shoes',
      price: 129.99,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
    ),
    Product(
      id: '5',
      name: 'Samsung Galaxy Watch',
      description: 'Smartwatch with health monitoring',
      price: 329.99,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
    ),
    Product(
      id: '6',
      name: 'Canon Camera',
      description: 'Professional DSLR camera',
      price: 1899.99,
      imageUrl:
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [..._products];
    }
    return _products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
