import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/controllers/checkout_controller.dart';

class PaymentForm extends StatelessWidget {
  final CheckoutController controller;

  const PaymentForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.paymentFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.cardNumberController,
            decoration: const InputDecoration(
              labelText: 'Card Number',
              prefixIcon: Icon(Icons.credit_card_outlined),
            ),
            keyboardType: TextInputType.number,
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter your card number' : null,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.expiryController,
                  decoration: const InputDecoration(
                    labelText: 'MM/YY',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Please enter expiry date'
                      : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: controller.cvvController,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    prefixIcon: Icon(Icons.security_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter CVV' : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}