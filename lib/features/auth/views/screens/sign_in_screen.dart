import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/common/utils/validation_utils.dart';
import 'package:multi_vendor_ecommerce_application/core/common/widgets/custom_button.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/forgot_password_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/sign_up_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/widgets/custom_text_field.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/widgets/social_button.dart';
import 'package:multi_vendor_ecommerce_application/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  String? emailError;
  String? passwordError;

  void validateInputs() {
    setState(() {
      emailError = ValidationUtils.validateEmail(emailController.text);
      passwordError = ValidationUtils.validatePassword(passwordController.text);
    });
  }

  bool get isValid => emailError == null && passwordError == null;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isDark ? Colors.white : AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.white70 : AppColors.textLight,
                    ),
              ),
              const SizedBox(height: 40),

              // email textfield
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                errorText: emailError,
                onFieldSubmitted: (_) {
                  validateInputs();
                  FocusScope.of(context).unfocus();
                },
              ),

              const SizedBox(height: 16),

              // password textfield
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock_outline,
                controller: passwordController,
                isPassword: true,
                errorText: passwordError,
                onFieldSubmitted: (_) {
                  validateInputs();
                  FocusScope.of(context).unfocus();
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: isDark ? Colors.white70 : AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // signin button
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                },
                isLoading: isLoading,
                isDisabled: !isValid,
              ),

              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.white38 : Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: isDark ? Colors.white38 : Colors.grey[400],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // social icons
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      icon: 'assets/images/google.png',
                      lable: 'Google',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      icon: 'assets/images/facebook.png',
                      lable: 'Google',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an accout?",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : AppColors.textDark,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: isDark ? Colors.white : AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
