import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/features/categories/models/category.dart';
import 'package:multi_vendor_ecommerce_application/features/categories/views/widgets/category_card.dart';
import '../../../../core/config/theme/app_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context, isDark),
      body: _buildCategoriesGrid(context),
    );
  }

  AppBar _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      title: Text(
        'Categories',
        style: TextStyle(
          color: isDark ? Colors.white : AppColors.textDark,
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    // Mock categories for UI display - will be replaced with actual data
    final mockCategories = _getMockCategories();
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: mockCategories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          category: mockCategories[index],
        );
      },
    );
  }
  
  // Mock data that will be replaced with actual backend data later
  List<Category> _getMockCategories() {
    return [
      Category(
        name: 'Electronics',
        icon: Icons.devices,
        color: AppColors.primary,
      ),
      Category(
        name: 'Fashion',
        icon: Icons.shopping_bag,
        color: Colors.pink,
      ),
      Category(
        name: 'Home & Garden',
        icon: Icons.home,
        color: Colors.green,
      ),
      Category(
        name: 'Furnitures',
        icon: Icons.chair,
        color: Colors.brown,
      ),
      Category(
        name: 'Beauty',
        icon: Icons.face,
        color: Colors.purple,
      ),
      Category(
        name: 'Toys & Games',
        icon: Icons.toys,
        color: Colors.red,
      ),
    ];
  }
}
