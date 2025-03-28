import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/profile_controller.dart';

class ProfileOptionsWidget extends StatelessWidget {
  final ProfileController controller;
  const ProfileOptionsWidget({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    // Mock data - will be replaced with actual data later
    final isAuthenticated = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildOptionTile(
            context,
            icon: Icons.person_outline,
            title: 'Edit Profile',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToEditProfile,
          ),
          _buildOptionTile(
            context,
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToMyOrders,
          ),
          _buildOptionTile(
            context,
            icon: Icons.location_on_outlined,
            title: 'Shipping Address',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToShippingAddress,
          ),
          _buildOptionTile(
            context,
            icon: Icons.help_outline,
            title: 'Help Center',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToHelpCenter,
          ),
          _buildOptionTile(
            context,
            icon: Icons.brightness_6,
            title: 'Theme',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.showThemeDialog,
          ),
          _buildOptionTile(
            context,
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToPrivacyPolicy,
          ),
          _buildOptionTile(
            context,
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            // onTap: () {
            //   // Will be implemented with backend integration
            // },
            onTap: controller.navigateToTermsConditions,
          ),
          if (isAuthenticated)
            _buildOptionTile(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Will be implemented with backend integration
              },
              isDestructive: true,
            ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDestructive
                        ? AppColors.error.withOpacity(0.1)
                        : AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: isDestructive
                        ? AppColors.error
                        : (isDark ? Colors.white : AppColors.primary),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDestructive
                          ? AppColors.error
                          : (isDark ? Colors.white : AppColors.textDark),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
