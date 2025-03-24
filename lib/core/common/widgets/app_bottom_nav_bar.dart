import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? Color(0xFF1E1E1E) : Colors.white),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3):
            Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: selectedItemColor ?? AppColors.primary,
          unselectedItemColor: unselectedItemColor ?? (
            isDark ? Colors.grey : AppColors.textLight
          ),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          items: [
            _buildNavItem(Icons.home_rounded, 'Home', 0),
            _buildNavItem(Icons.category_rounded, 'Categories', 1),
            _buildNavItem(Icons.shopping_cart_rounded, 'Cart', 2),
            _buildNavItem(Icons.person_rounded, 'Profile', 3),
          ],
        ),
      ),),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ){
    return BottomNavigationBarItem(
      icon: Builder(builder: (context){
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentIndex == index ? 
          (isDark ? AppColors.primary.withOpacity(0.2) : AppColors.primary.withOpacity(0.1)):
          Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        );
      }),
      label: label,
      );
  }
}
