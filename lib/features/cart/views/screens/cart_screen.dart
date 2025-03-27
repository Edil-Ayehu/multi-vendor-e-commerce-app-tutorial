import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/controllers/cart_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/cart_item_widget.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/checkout_section.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/empty_cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.find<CartController>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    // For now, using a mock user ID
    const userId = 'mock-user-id';
    await _cartController.loadCart(userId);
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isDark ? Colors.white : AppColors.textDark,
              ),
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Obx(() => _buildCartContent()),
    );
  }

  Widget _buildCartContent() {
    if (_cartController.items.isEmpty) {
      return const EmptyCartState();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _cartController.items.length,
            itemBuilder: (context, index) {
              final item = _cartController.items[index];
              return CartItemWidget(
                cartItem: item,
                onQuantityChanged: (id, newQuantity) {
                  _cartController.updateQuantity('mock-user-id', id, newQuantity);
                },
                onRemoveItem: (id) {
                  _cartController.removeItem('mock-user-id', id);
                },
              );
            },
          ),
        ),
        CheckoutSection(items: _cartController.items),
      ],
    );
  }
}
