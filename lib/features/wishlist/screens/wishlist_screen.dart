import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/controllers/wishlist_controller.dart';
import '../../../core/config/theme/app_colors.dart';
import '../widgets/empty_wishlist_state.dart';
import '../widgets/wishlist_product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final wishlistController = WishlistController.to;
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: TextStyle(color: isDark ? Colors.white : AppColors.textDark)
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: Obx(() {
        final wishlistItems = wishlistController.wishlistItems;

        if (wishlistItems.isEmpty) {
          return const EmptyWishlistState();
        }

        return GridView.builder(
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
        );
      }),
    );
  }
}
