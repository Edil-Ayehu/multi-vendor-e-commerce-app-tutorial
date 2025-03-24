import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/categories/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Navigation will be implemented later
        // For now, just show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected category: ${category.name}')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: _buildCardContent(context, isDark),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconContainer(),
        const SizedBox(height: 12),
        _buildCategoryName(context, isDark),
        _buildItemCount(context, isDark),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: category.color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        category.icon,
        size: 40,
        color: category.color,
      ),
    );
  }

  Widget _buildCategoryName(BuildContext context, bool isDark) {
    return Text(
      category.name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDark ? Colors.white : AppColors.textDark,
          ),
    );
  }

  Widget _buildItemCount(BuildContext context, bool isDark) {
    // Static item count for UI display
    return Text(
      '${category.itemCount} Items',
      style: TextStyle(
        color: isDark ? Colors.grey[400] : AppColors.textLight,
        fontSize: 12,
      ),
    );
  }
}
