import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<String> _wishlistItemIds = [];

  List<String> get wishlistItemIds => [..._wishlistItemIds];

  bool isInWishlist(String productId) {
    return _wishlistItemIds.contains(productId);
  }

  void toggleWishlist(String productId) {
    if (_wishlistItemIds.contains(productId)) {
      _wishlistItemIds.remove(productId);
    } else {
      _wishlistItemIds.add(productId);
    }
    notifyListeners();
  }

  int get wishlistCount => _wishlistItemIds.length;

  void clearWishlist() {
    _wishlistItemIds.clear();
    notifyListeners();
  }
}
