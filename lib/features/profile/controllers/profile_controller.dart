import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      debugPrint('Navigate to Edit Profile');
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
      debugPrint('Navigate to Shipping Address');
    } else {
      showAuthPrompt();
    }
  }
  
  void navigateToHelpCenter() {
    // Will be implemented with actual navigation
    debugPrint('Navigate to Help Center');
  }
  
  void navigateToPrivacyPolicy() {
    // Will be implemented with actual navigation
    debugPrint('Navigate to Privacy Policy');
  }
  
  void navigateToTermsConditions() {
    // Will be implemented with actual navigation
    debugPrint('Navigate to Terms & Conditions');
  }
  
  void showAuthPrompt() {
    // Will be implemented with actual bottom sheet
    debugPrint('Show Auth Prompt');
  }
  
  void showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        backgroundColor: Theme.of(context).cardColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Light'),
              selected: Theme.of(context).brightness == Brightness.light,
              onTap: () => _changeTheme(context, ThemeMode.light),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark'),
              selected: Theme.of(context).brightness == Brightness.dark,
              onTap: () => _changeTheme(context, ThemeMode.dark),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_auto),
              title: const Text('System'),
              selected: MediaQuery.platformBrightnessOf(context) == Theme.of(context).brightness,
              onTap: () => _changeTheme(context, ThemeMode.system),
            ),
          ],
        ),
      ),
    );
  }
  
  void _changeTheme(BuildContext context, ThemeMode mode) {
    // Will be implemented with actual theme change
    debugPrint('Change theme to: $mode');
    Navigator.pop(context);
  }
  
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          'Logout',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.green),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _logout();
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