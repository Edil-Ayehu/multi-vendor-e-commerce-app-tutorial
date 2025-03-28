import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/common/utils/text_scale_wrapper.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_theme.dart';
import 'package:multi_vendor_ecommerce_application/core/controllers/theme_controller.dart';
import 'package:multi_vendor_ecommerce_application/core/routes/app_routes.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/controllers/cart_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/cart/repositories/cart_repository.dart';
import 'package:multi_vendor_ecommerce_application/features/onboarding/controllers/onboarding_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/controllers/order_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/repositories/order_repository.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/help_center_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/privacy_policy_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/profile_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/terms_conditions_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/splash/controllers/splash_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/controllers/wishlist_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/repositories/wishlist_repository.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async => ThemeController());
  Get.put(SplashController());
  Get.put(OnboardingController());
  Get.put(ProfileController());
   Get.put(HelpCenterController());
   Get.put(PrivacyPolicyController());
   Get.put(TermsConditionsController());

  // Initialize cart dependencies
  final cartRepository = CartRepository();
  Get.put(cartRepository);
  final cartController = CartController(repository: cartRepository);
  Get.put(cartController);

  // Initialize order dependencies
  final orderRepository = OrderRepository();
  Get.put(orderRepository);
  Get.put(OrderController(
    repository: orderRepository,
    cartController: cartController,
  ));

    // Initialize wishlist dependencies
  final wishlistRepository = WishlistRepository();
  Get.put(wishlistRepository);
  Get.put(WishlistController(repository: wishlistRepository));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: TextScaleWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Multi-Vendor E-commerce App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeController.to.themeMode,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
