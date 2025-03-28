import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';

class PrivacySectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final bool isDark;

  const PrivacySectionWidget({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 16,
            ),
          ),
          childrenPadding: const EdgeInsets.all(16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content
            .split('\n')
            .map((line) => Padding(
                  padding: EdgeInsets.only(
                    left: line.startsWith('•') ? 16 : 0,
                    bottom: 8,
                  ),
                  child: Text(
                    line,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
