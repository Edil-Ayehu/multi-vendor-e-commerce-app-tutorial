import '../../products/models/product_model.dart';

class WishlistRepository {
  // In-memory storage for demo purposes
  final Map<String, List<Product>> _wishlistStorage = {};

  WishlistRepository() {
    // Initialize with dummy data
    _wishlistStorage['mock-user-id'] = [
            Product(
        id: 'wish1',
        name: 'Smart Watch Pro',
        description: 'Latest smartwatch with health tracking features',
        price: 199.99,
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRycJFC-K_NUePTxMzv8IK4t35M69QY_Un3iA&s'
        ],
        category: 'Electronics',
        sellerId: 'seller1',
        stock: 15,
        createdAt: DateTime.now(),
      ),
      Product(
        id: 'wish2',
        name: 'Wireless Earbuds',
        description: 'Premium wireless earbuds with noise cancellation',
        price: 149.99,
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCl78pwgs0Fhzb6QWfZYY9HWYLtwpTXaEKg&s'
        ],
        category: 'Electronics',
        sellerId: 'seller2',
        stock: 20,
        createdAt: DateTime.now(),
      ),
            Product(
        id: 'wish3',
        name: 'Running Shoes',
        description: 'Professional running shoes for athletes',
        price: 89.99,
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy8Reb18192K1ewlvSPUUAFlHPnCt-APTSkeTdV46upRvafIM7_k8ZgtLEMkYUVN5X-HU&usqp=CAU'
        ],
        category: 'Sports',
        sellerId: 'seller3',
        stock: 30,
        createdAt: DateTime.now(),
      ),
            Product(
        id: 'wish4',
        name: 'Laptop Backpack',
        description: 'Water-resistant laptop backpack with USB charging port',
        price: 59.99,
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEx4CxhtkxMtIfnEQgOYKPT03ntg2_WelaRbdF1DyoRHNFQ2xi6h3uDNuQ_7zfX_-NEVw&usqp=CAU'
        ],
        category: 'Fashion',
        sellerId: 'seller4',
        stock: 25,
        createdAt: DateTime.now(),
      ),
    ];
    }

  Future<List<Product>> getWishlistItems(String userId) async {
    return _wishlistStorage[userId] ?? [];
  }

  Future<void> addToWishlist(String userId, Product product) async {
    _wishlistStorage[userId] = [...(_wishlistStorage[userId] ?? []), product];
  }

  Future<void> removeFromWishlist(String userId, String productId) async {
    _wishlistStorage[userId] = (_wishlistStorage[userId] ?? [])
        .where((product) => product.id != productId)
        .toList();
  }

  Future<bool> isInWishlist(String userId, String productId) async {
    return (_wishlistStorage[userId] ?? [])
        .any((product) => product.id == productId);
  }
}
