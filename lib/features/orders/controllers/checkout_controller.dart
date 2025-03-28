import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/controllers/order_controller.dart';
import '../../../features/profile/models/shipping_address_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();
  
  final currentStep = 0.obs;
  final isProcessing = false.obs;
  
  // Form Controllers
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  
  // Form Keys
  final addressFormKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Remove loadSavedAddress() call since it uses Firestore
  }

  @override
  void onClose() {
    // Dispose controllers
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    } else {
      processPayment();
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  Future<void> processPayment() async {
    if (!addressFormKey.currentState!.validate() ||
        !paymentFormKey.currentState!.validate()) {
      _showErrorSnackbar('Please fill all required fields');
      return;
    }

    isProcessing.value = true;

    try {
      final shippingAddress = ShippingAddress(
        street: addressController.text,
        city: cityController.text,
        state: stateController.text,
        zipCode: zipController.text,
      );

      final paymentDetails = {
        'cardNumber': cardNumberController.text,
        'expiry': expiryController.text,
        'cvv': cvvController.text,
      };

      await OrderController.to.placeOrder(
        shippingAddress: shippingAddress,
        paymentDetails: paymentDetails,
      );
    } catch (e) {
      _showErrorSnackbar('Payment failed: $e');
    } finally {
      isProcessing.value = false;
    }
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      icon: const Icon(Icons.error_outline, color: Colors.red),
    );
  }
}
