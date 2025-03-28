import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';

class ShippingAddressFormFields extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;

  const ShippingAddressFormFields({
    super.key,
    required this.streetController,
    required this.cityController,
    required this.stateController,
    required this.zipController,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
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
      child: Column(
        children: [
          TextFormField(
            controller: streetController,
            decoration: InputDecoration(
              labelText: 'Street Address',
              prefixIcon: const Icon(Icons.location_on_outlined,
                  color: AppColors.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
              ),
            ),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: cityController,
            decoration: InputDecoration(
              labelText: 'City',
              prefixIcon: const Icon(Icons.location_city, color: AppColors.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
              ),
            ),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(
                    labelText: 'State',
                    prefixIcon: const Icon(Icons.map_outlined, color: AppColors.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
                    ),
                  ),
                  validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: zipController,
                  decoration: InputDecoration(
                    labelText: 'ZIP Code',
                    prefixIcon: const Icon(Icons.pin_drop, color: AppColors.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
                    ),
                  ),
                  validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
