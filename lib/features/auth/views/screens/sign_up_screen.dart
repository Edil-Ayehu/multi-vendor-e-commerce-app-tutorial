import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/common/utils/validation_utils.dart';
import 'package:multi_vendor_ecommerce_application/core/common/widgets/custom_button.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/screens/sign_in_screen.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/widgets/custom_text_field.dart';
import 'package:multi_vendor_ecommerce_application/features/auth/views/widgets/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  String selectedRole = 'customer'; // Default role

  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void validateInputs() {
    setState(() {
      emailError = ValidationUtils.validateEmail(emailController.text);
      passwordError = ValidationUtils.validatePassword(passwordController.text);
      confirmPasswordError = ValidationUtils.validateConfirmPassword(
        passwordController.text,
        confirmPasswordController.text,
      );
    });
  }

  bool get isValid =>
      emailError == null &&
      passwordError == null &&
      confirmPasswordError == null;

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
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : AppColors.textDark,
                ),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isDark ? Colors.white : AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign up to get Started!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.grey[400] : AppColors.textLight,
                    ),
              ),
              const SizedBox(height: 32),
              // name textfield
              CustomTextField(
                label: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline,
                controller: nameController,
              ),

              const SizedBox(height: 16),
              // email textfield
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                errorText: emailError,
                onChanged: (value) {
                  validateInputs();
                },
              ),

              const SizedBox(height: 16),

              // password field
              CustomTextField(
                label: 'Password',
                hintText: 'Create a password',
                prefixIcon: Icons.lock_outline,
                controller: passwordController,
                isPassword: true,
                errorText: passwordError,
                onChanged: (value) {
                  validateInputs();
                },
              ),

              const SizedBox(height: 16),

              // confirm password field

              CustomTextField(
                label: 'Confirm Password',
                hintText: 'Confirm your password',
                prefixIcon: Icons.lock_outline,
                controller: confirmPasswordController,
                isPassword: true,
                errorText: confirmPasswordError,
                onChanged: (value) {
                  validateInputs();
                },
              ),

              const SizedBox(height: 16),

              _buildRoleSelector(isDark),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
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
                    "Already have an account?",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : AppColors.textDark,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign In',
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

  Widget _buildRoleSelector(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I want to',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDark ? Colors.white70 : Colors.black87,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: 'customer',
                title: Text(
                  'Shop',
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                groupValue: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: 'vendor',
                title: Text(
                  'Sell',
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                groupValue: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
