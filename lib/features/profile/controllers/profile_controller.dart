import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/sign_in_screen.dart';

import '../../../core/routes/app_routes.dart';

class ProfileController {
  // Singleton pattern for easy access
  static final ProfileController _instance = ProfileController._internal();
  static ProfileController get instance => _instance;
  
  factory ProfileController() {
    return _instance;
  }
  
  ProfileController._internal();
  
  // Mock authentication state
  bool _isAuthenticated = true;
  bool get isAuthenticated => _isAuthenticated;
  
  // Mock data
  int _ordersCount = 5;
  int get ordersCount => _ordersCount;
  
  // Navigation methods
  void navigateToEditProfile() {
    if (isAuthenticated) {
      // Will be implemented with actual navigation
      // debugPrint('Navigate to Edit Profile');
      Get.toNamed(AppRoutes.editProfile);
    } else {
      showAuthPrompt();
    }
  }
  
  void navigateToMyOrders() {
    if (isAuthenticated) {
      // Will be implemented with actual navigation
      Get.toNamed(AppRoutes.myOrders);
    } else {
      showAuthPrompt();
    }
  }
  
  void navigateToShippingAddress() {
    if (isAuthenticated) {
      // Will be implemented with actual navigation
      // debugPrint('Navigate to Shipping Address');
      Get.toNamed(AppRoutes.shippingAddress);
    } else {
      showAuthPrompt();
    }
  }
  
  void navigateToHelpCenter() {
    // Will be implemented with actual navigation
    // debugPrint('Navigate to Help Center');
    Get.toNamed(AppRoutes.helpCenter);
  }
  
  void navigateToPrivacyPolicy() {
    // Will be implemented with actual navigation
    // debugPrint('Navigate to Privacy Policy');
    Get.toNamed(AppRoutes.privacyPolicy);
  }
  
  void navigateToTermsConditions() {
    // Will be implemented with actual navigation
    // debugPrint('Navigate to Terms & Conditions');
    Get.toNamed(AppRoutes.termsConditions);
  }
  
  void showAuthPrompt() {
    // Will be implemented with actual bottom sheet
    debugPrint('Show Auth Prompt');
  }
  
  void showThemeDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Choose Theme'),
        backgroundColor: Get.theme.cardColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Light'),
              selected: Get.theme.brightness == Brightness.light,
              onTap: () => _changeTheme(ThemeMode.light),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark'),
              selected: Get.theme.brightness == Brightness.dark,
              onTap: () => _changeTheme(ThemeMode.dark),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_auto),
              title: const Text('System'),
              selected: Get.theme.brightness == ThemeMode.system,
              onTap: () => _changeTheme(ThemeMode.system),
            ),
          ],
        ),
      ),
    );
  }
  
  void _changeTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
    Get.back();
  }
  
  void showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Get.theme.cardColor,
        title: Text(
          'Logout',
          style: Get.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: Get.textTheme.bodyLarge!.copyWith(color: Colors.green),
            ),
          ),
          FilledButton(
            onPressed: () {
              Get.back();
              Get.offAll(() => const SignInScreen());
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
  
  void _logout() {
    // Will be implemented with actual logout
    _isAuthenticated = false;
    debugPrint('User logged out');
  }
  
  // Mock data for UI stats
  int getCartItemsCount() => 3;
  int getWishlistItemsCount() => 7;
}