import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/profile_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/profile_header_widget.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/views/widgets/profile_options_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderWidget(),
            const SizedBox(height: 20),
            ProfileOptionsWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}
