import 'cart_item_model.dart';

class CartModel {
  final String userId;
  final List<CartItem> items;
  double get total => items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  CartModel({
    required this.userId,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      userId: map['userId'],
      items: (map['items'] as List).map((item) => CartItem.fromMap(item)).toList(),
    );
  }

  factory CartModel.empty(String userId) {
    return CartModel(userId: userId, items: []);
  }
}
