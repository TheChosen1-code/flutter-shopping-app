import 'package:flutter/material.dart';
import '../productdata.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<CartItem> _favorites = [];

  List<CartItem> get favorites => _favorites;

  bool isFavorite(Product product) {
    return _favorites.any((item) => item.product == product);
  }

  void toggleFavorite(Product product) {
    final index = _favorites.indexWhere((item) => item.product == product);

    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(
        CartItem(product: product, size: 0, quantity: 1, price: product.price),
      );
    }
    notifyListeners();
  }

  void removeAt(int index) {
    _favorites.removeAt(index);
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;
    for (final item in _favorites) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
