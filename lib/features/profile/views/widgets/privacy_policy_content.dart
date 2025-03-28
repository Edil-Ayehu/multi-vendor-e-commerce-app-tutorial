import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/privacy_policy_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/privacy_section_widget.dart';

class PrivacyPolicyContent extends StatelessWidget {
  final PrivacyPolicyController controller;
  final bool isDark;

  const PrivacyPolicyContent({
    super.key,
    required this.controller,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(() => Column(
            children: controller
                .getPrivacySections()
                .map(
                  (section) => PrivacySectionWidget(
                    title: section.title,
                    content: section.content,
                    icon: section.icon,
                    isDark: isDark,
                  ),
                )
                .toList(),
          )),
    );
  }
}
