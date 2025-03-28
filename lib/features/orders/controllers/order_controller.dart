import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/orders/repositories/order_repository.dart';
import '../views/screens/order_confirmation_screen.dart';
import '../models/order_model.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../profile/models/shipping_address_model.dart';
import '../../../core/common/utils/toast_utils.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();
  
  final CartController _cartController;
  final OrderRepository _repository;
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxBool isProcessing = false.obs;

  OrderController({
    required OrderRepository repository,
    required CartController cartController,
  })  : _repository = repository,
        _cartController = cartController;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      // TODO: Implement order loading logic
    } catch (e) {
      _showError('Failed to load orders: $e');
    }
  }

  Future<void> placeOrder({
    required ShippingAddress shippingAddress,
    required Map<String, dynamic> paymentDetails,
  }) async {
    try {
      isProcessing.value = true;
      
      final cartItems = _cartController.items;
      if (cartItems.isEmpty) throw 'Cart is empty';

      // TODO: Implement order creation logic

      await _cartController.clearCart('mock-user-id');
      _showSuccess('Order placed successfully');
      Get.offAll(() => const OrderConfirmationScreen());
    } catch (e) {
      _showError('Failed to place order: $e');
    } finally {
      isProcessing.value = false;
    }
  }

  void _showSuccess(String message) {
    if (!Get.context!.mounted) return;
    ToastUtils.showSuccessToast(
      context: Get.context!,
      title: 'Success',
      description: message,
    );
  }

  void _showError(String message) {
    if (!Get.context!.mounted) return;
    ToastUtils.showErrorToast(
      context: Get.context!,
      title: 'Error',
      description: message,
    );
  }
}
