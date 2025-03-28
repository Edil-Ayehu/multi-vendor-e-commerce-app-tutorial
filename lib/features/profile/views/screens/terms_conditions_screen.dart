import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/terms_conditions_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/terms_conditions_content.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/terms_conditions_header.dart';

class TermsConditionsScreen extends GetView<TermsConditionsController> {
  TermsConditionsScreen({super.key, bool isVendor = false}) {
    controller.setVendorStatus(isVendor);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TermsConditionsHeader(
                  isVendor: controller.isVendor,
                  size: size,
                ),
                TermsConditionsContent(
                  controller: controller,
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
