import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/products/models/product_model.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/widgets/empty_wishlist_state.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/widgets/wishlist_product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Mock data - will be replaced with actual data later
    final List<Product> wishlistItems = _getMockWishlistItems();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('My Wishlist',
            style:
                TextStyle(color: isDark ? Colors.white : AppColors.textDark)),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: wishlistItems.isEmpty
          ? const EmptyWishlistState()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final product = wishlistItems[index];
                return WishlistProductCard(product: product);
              },
            ),
    );
  }

  // Mock data for UI testing
  List<Product> _getMockWishlistItems() {
    return [
      Product(
        id: '1',
        sellerId: 'seller1',
        name: 'Wireless Headphones',
        description: 'High-quality wireless headphones with noise cancellation',
        price: 129.99,
        images: [
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80'
        ],
        category: 'Electronics',
        stock: 10,
        createdAt: DateTime.now(),
      ),
      Product(
        id: '2',
        sellerId: 'seller2',
        name: 'Smart Watch',
        description: 'Fitness tracker with heart rate monitor',
        price: 199.99,
        images: [
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80'
        ],
        category: 'Electronics',
        stock: 15,
        createdAt: DateTime.now(),
      ),
    ];
  }
}
