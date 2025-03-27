import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
    
    // TODO: Implement payment processing logic
    
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    isProcessing.value = false;
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