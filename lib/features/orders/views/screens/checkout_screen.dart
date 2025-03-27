import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/controllers/checkout_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/views/widgets/address_form.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/views/widgets/order_summary.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/views/widgets/payment_form.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isDark ? Colors.white : AppColors.textDark,
              ),
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
          ),
        ),
        child: Obx(() => Stepper(
          currentStep: controller.currentStep.value,
          onStepContinue: controller.isProcessing.value
              ? null
              : controller.nextStep,
          onStepCancel: controller.isProcessing.value
              ? null
              : controller.previousStep,
          controlsBuilder: (context, details) {
            return _buildStepperControls(details);
          },
          steps: [
            Step(
              title: const Text('Shipping Address'),
              content: _buildAddressForm(),
              isActive: controller.currentStep.value >= 0,
            ),
            Step(
              title: const Text('Payment Method'),
              content: _buildPaymentForm(),
              isActive: controller.currentStep.value >= 1,
            ),
            Step(
              title: const Text('Order Summary'),
              content: _buildOrderSummary(),
              isActive: controller.currentStep.value >= 2,
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildAddressForm() {
    return AddressForm(controller: controller);
  }

  Widget _buildPaymentForm() {
    return PaymentForm(controller: controller);
  }

  Widget _buildOrderSummary() {
    return const OrderSummary();
  }

  Widget _buildStepperControls(ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: controller.isProcessing.value ? null : details.onStepContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: controller.isProcessing.value && controller.currentStep.value == 2
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      controller.currentStep.value == 2 ? 'Place Order' : 'Continue',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
          if (controller.currentStep.value > 0) ...[
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: controller.isProcessing.value ? null : details.onStepCancel,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
