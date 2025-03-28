import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/help_center_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/faq_section.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/support_section.dart';

class HelpCenterScreen extends GetView<HelpCenterController> {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context, isDark),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SupportSection(controller: controller),
            FAQSection(
              controller: controller,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      title: Text(
        'Help Center',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }
}
