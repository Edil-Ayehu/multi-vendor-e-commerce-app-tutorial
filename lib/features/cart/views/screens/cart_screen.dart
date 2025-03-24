import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/models/cart_item_model.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/cart_item_widget.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/checkout_section.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/views/widgets/empty_cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock data for UI display - will be replaced with actual data from backend
  List<CartItem> _cartItems = [
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
        CartItem(
      id: '4',
      productId: 'prod-004',
      productName: 'Bluetooth Speaker',
      price: 79.99,
      image: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      quantity: 1,
      sellerId: 'seller-001',
    ),
    CartItem(
      id: '5',
      productId: 'prod-005',
      productName: 'Laptop Backpack',
      price: 49.99,
      image: 'https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      quantity: 1,
      sellerId: 'seller-004',
    ),
  ];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading data
    _loadMockData();
  }

  void _loadMockData() {
    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          // Sample cart items for UI display
          _cartItems = _getMockCartItems();
          _isLoading = false;
        });
      }
    });
  }

  List<CartItem> _getMockCartItems() {
    // This will be replaced with actual data from backend
    return _cartItems;
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
          : _buildCartContent(),
    );
  }

  Widget _buildCartContent() {
    if (_cartItems.isEmpty) {
      return const EmptyCartState();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _cartItems.length,
            itemBuilder: (context, index) {
              final item = _cartItems[index];
              return CartItemWidget(
                cartItem: item,
                onQuantityChanged: (id, newQuantity) {
                  // Will be implemented with backend integration
                },
                onRemoveItem: (id) {
                  // Will be implemented with backend integration
                },
              );
            },
          ),
        ),
        CheckoutSection(items: _cartItems),
      ],
    );
  }
}
