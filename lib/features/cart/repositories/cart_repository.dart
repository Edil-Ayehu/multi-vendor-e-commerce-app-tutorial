import '../models/cart_item_model.dart';

class CartRepository {
  // In-memory storage
  final Map<String, List<CartItem>> _cartStorage = {};

    CartRepository() {
    // Initialize with dummy data 
    _cartStorage['mock-user-id'] = [
      CartItem(
        id: '1',
        productId: 'prod-001',
        productName: 'Wireless Headphones',
        price: 129.99,
        image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
        quantity: 1,
        sellerId: 'seller-001',
      ),
      CartItem(
        id: '2',
        productId: 'prod-002',
        productName: 'Smart Watch',
        price: 199.99,
        image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
        quantity: 1,
        sellerId: 'seller-002',
      ),
            CartItem(
        id: '3',
        productId: 'prod-003',
        productName: 'Smartphone Case',
        price: 24.99,
        image: 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
        quantity: 2,
        sellerId: 'seller-003',
      ),
    ];
  }

  Future<List<CartItem>> getCartItems(String userId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _cartStorage[userId] ?? [];
  }

  Future<void> addCartItem(String userId, CartItem item) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!_cartStorage.containsKey(userId)) {
      _cartStorage[userId] = [];
    }
    _cartStorage[userId]!.add(item);
  }

  Future<void> updateCartItemQuantity(
      String userId, String itemId, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final items = _cartStorage[userId];
    if (items != null) {
      final index = items.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        final item = items[index];
        items[index] = CartItem(
          id: item.id,
          productId: item.productId,
          productName: item.productName,
          price: item.price,
          image: item.image,
          quantity: quantity,
          sellerId: item.sellerId,
        );
      }
    }
  }

  Future<void> removeCartItem(String userId, String itemId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final items = _cartStorage[userId];
    if (items != null) {
      items.removeWhere((item) => item.id == itemId);
    }
  }

  Future<void> clearCart(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _cartStorage[userId] = [];
  }
}
