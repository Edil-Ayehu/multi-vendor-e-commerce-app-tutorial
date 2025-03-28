import 'package:get/get.dart';
import '../models/shipping_address_model.dart';

class ShippingAddressController extends GetxController {
  static ShippingAddressController get to => Get.find();
  
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  
  final _address = Rxn<ShippingAddress>();
  ShippingAddress? get address => _address.value;

  final _isAddressLoading = true.obs;
  bool get isAddressLoading => _isAddressLoading.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadAddress() async {
    try {
      _isAddressLoading.value = true;
      // TODO: Implement address loading logic
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay
    } catch (e) {
      print('Error loading address: $e');
    } finally {
      _isAddressLoading.value = false;
    }
  }

  Future<void> saveAddress(ShippingAddress address) async {
    _isLoading.value = true;
    try {
      // TODO: Implement address saving logic
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay
      _address.value = address;
      Get.back();
      _showSuccessMessage();
    } catch (e) {
      _showErrorMessage();
    } finally {
      _isLoading.value = false;
    }
  }

  void _showSuccessMessage() {
    Get.snackbar(
      'Success',
      'Shipping address updated successfully',
      backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.1),
      colorText: Get.theme.colorScheme.primary,
      snackPosition: SnackPosition.TOP,
    );
  }

  void _showErrorMessage() {
    Get.snackbar(
      'Error',
      'Failed to update shipping address',
      backgroundColor: Get.theme.colorScheme.error.withOpacity(0.1),
      colorText: Get.theme.colorScheme.error,
      snackPosition: SnackPosition.TOP,
    );
  }
}
