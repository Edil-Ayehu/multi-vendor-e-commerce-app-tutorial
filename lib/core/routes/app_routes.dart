import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/sign_in_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/onboarding/screens/onboarding_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/views/screens/my_orders_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/screens/edit_profile_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/screens/help_center_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/screens/shipping_address_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signin';

  // profile
  static const String myOrders = '/my-orders';
  static const String editProfile = '/edit-profile';
  static const String shippingAddress = '/shipping-address';
  static const String helpCenter = '/help-center';

  static final routes = [
    GetPage(name: splash, page: ()=> const SplashScreen()),
    GetPage(name: onboarding, page: ()=> const OnboardingScreen()),
    GetPage(name: signIn, page: ()=> const SignInScreen()),

    GetPage(name: editProfile, page: () => EditProfileScreen()),
    GetPage(name: myOrders, page: () => const MyOrdersScreen()),
    GetPage(name: shippingAddress, page: () => const ShippingAddressScreen()),
    GetPage(name: helpCenter, page: () => const HelpCenterScreen()),
  ];
}