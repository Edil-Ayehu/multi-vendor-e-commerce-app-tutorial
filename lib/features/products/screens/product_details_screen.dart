import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/products/models/product_model.dart';
import 'package:multi_vendor_ecommerce_application/features/products/models/review_model.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/all_reviews_sheet.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/product_app_bar.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/product_bottom_bar.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/product_info_section.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/review_dialog.dart';
import 'package:multi_vendor_ecommerce_application/features/products/widgets/reviews_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedImageIndex = 0;
  final _reviewController = TextEditingController();
  bool _isAddingToCart = false;
  
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _showReviewDialog(BuildContext context) {
    // Mock implementation that will be replaced with actual backend integration
    ReviewDialog.show(
      context,
      controller: null, // Will be replaced with actual controller
      reviewController: _reviewController,
    );
  }

  void _showAllReviews(BuildContext context) {
    // Mock implementation that will be replaced with actual backend integration
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        // Mock empty reviews list - will be replaced with actual data
        final List<Review> mockReviews = [];
        
        if (mockReviews.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Icon(
                  Icons.rate_review_outlined,
                  size: 64,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white54
                      : Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No reviews yet',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white54
                        : Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }

        return AllReviewsSheet(reviews: mockReviews);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = true; // Will be replaced with actual auth check

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          ProductAppBar(
            product: widget.product,
            selectedImageIndex: _selectedImageIndex,
            onImageSelected: (index) => setState(() => _selectedImageIndex = index),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfoSection(product: widget.product),
                ReviewsSection(
                  productId: widget.product.id,
                  onShowAllReviews: () => _showAllReviews(context),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: isAuthenticated
          ? FloatingActionButton.extended(
              onPressed: () => _showReviewDialog(context),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.rate_review),
              label: const Text('Write Review'),
            )
          : null,
      bottomNavigationBar: ProductBottomBar(
        product: widget.product,
        onAddingToCartChanged: (isAdding) => 
            setState(() => _isAddingToCart = isAdding),
      ),
    );
  }
}