import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/routes/app_routes.dart';
import 'package:multi_vendor_ecommerce_application/features/onboarding/models/onboarding_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();

  final pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingItem> items = [
    const OnboardingItem(
      title: 'Welcome to E-Shop',
      description: 'Discover Amazing products from various vendors',
      image: 'assets/images/onboarding.png',
    ),
    const OnboardingItem(
      title: 'Easy Shopping',
      description: 'Shop your favorite items with just a few taps',
      image: 'assets/images/onboarding1.png',
    ),
    const OnboardingItem(
      title: 'Fast Delivery',
      description: 'Get your items delivered right to your doorstep',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    Get.offAllNamed(AppRoutes.signIn);
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
