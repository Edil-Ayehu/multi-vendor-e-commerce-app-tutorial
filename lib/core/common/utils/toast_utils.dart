import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:toastification/toastification.dart';

class ToastUtils {
  static void showSuccessToast({
    required BuildContext context,
    required String title,
    String? description,
    Duration? duration,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      backgroundColor: isDark
          ? const Color(0xFF1B5E20) // Dark green
          : const Color(0xFF4CAF50), // AppColors.secondary
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
      description: description != null
          ? Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
            )
          : null,
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      boxShadow: isDark ? darkModeShadow : lightModeShadow,
      showProgressBar: true,
      dragToClose: true,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
    );
  }

  static void showErrorToast({
    required BuildContext context,
    required String title,
    String? description,
    Duration? duration,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      backgroundColor: isDark
          ? const Color(0xFF8B1F1F) // Dark red
          : AppColors.error,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
      description: description != null
          ? Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
            )
          : null,
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      boxShadow: isDark ? darkModeShadow : lightModeShadow,
      showProgressBar: true,
      dragToClose: true,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
    );
  }

  static void showInfoToast({
    required BuildContext context,
    required String title,
    String? description,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      description: description != null
          ? Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          : null,
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      boxShadow: lowModeShadow,
      showProgressBar: true,
      dragToClose: true,
    );
  }

  static const lowModeShadow = [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 4,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x19000000),
      blurRadius: 8,
      offset: Offset(0, 4),
      spreadRadius: -1,
    ),
  ];

  static const lightModeShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static const darkModeShadow = [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 12,
      offset: Offset(0, 4),
      spreadRadius: -2,
    ),
  ];
}
