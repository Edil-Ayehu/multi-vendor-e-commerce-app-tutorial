import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/sign_in_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/onboarding/screens/onboarding_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/splash/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signin';

  static final routes = [
    GetPage(name: splash, page: ()=> const SplashScreen()),
    GetPage(name: onboarding, page: ()=> const OnboardingScreen()),
    GetPage(name: signIn, page: ()=> const SignInScreen()),
  ];
}