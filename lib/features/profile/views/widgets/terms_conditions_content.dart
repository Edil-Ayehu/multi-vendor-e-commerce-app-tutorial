import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/terms_conditions_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/terms_section_widget.dart';

class TermsConditionsContent extends StatelessWidget {
  final TermsConditionsController controller;
  final bool isDark;

  const TermsConditionsContent({
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
                .getTermsSections()
                .map(
                  (section) => TermsSectionWidget(
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
