import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/controllers/checkout_controller.dart';

class AddressForm extends StatelessWidget {
  final CheckoutController controller;

  const AddressForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.addressFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.addressController,
            decoration: const InputDecoration(
              labelText: 'Street Address',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter your address' : null,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter your city' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: controller.stateController,
                  decoration: const InputDecoration(
                    labelText: 'State',
                    prefixIcon: Icon(Icons.map_outlined),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter your state' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.zipController,
            decoration: const InputDecoration(
              labelText: 'ZIP Code',
              prefixIcon: Icon(Icons.pin_drop_outlined),
            ),
            keyboardType: TextInputType.number,
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter your ZIP code' : null,
          ),
        ],
      ),
    );
  }
}
