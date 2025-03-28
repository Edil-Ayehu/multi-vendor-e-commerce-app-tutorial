import '../models/order_model.dart';
import '../../cart/models/cart_item_model.dart';
import '../../profile/models/shipping_address_model.dart';

class OrderRepository {
  Future<List<OrderModel>> getOrders(String userId) async {
    // TODO: Implement get orders logic
    return [];
  }

  Future<void> createOrder({
    required String userId,
    required List<CartItem> items,
    required ShippingAddress shippingAddress,
    required double total,
  }) async {
    // TODO: Implement create order logic
  }
}