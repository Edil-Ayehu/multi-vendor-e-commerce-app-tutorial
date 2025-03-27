import 'package:get/get.dart';
import '../repositories/cart_repository.dart';
import '../models/cart_model.dart';
import '../models/cart_item_model.dart';
import '../../products/models/product_model.dart';
import '../../../core/common/utils/toast_utils.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();
  
  final CartRepository _repository;
  final Rx<CartModel> cart = CartModel.empty('').obs;
  
  CartController({CartRepository? repository})
      : _repository = repository ?? CartRepository();

  List<CartItem> get items => cart.value.items;
  double get total => cart.value.total;

  Future<void> loadCart(String userId) async {
    try {
      final items = await _repository.getCartItems(userId);
      cart.value = CartModel(userId: userId, items: items);
    } catch (e) {
      _showError('Failed to load cart: $e');
    }
  }

  Future<void> addToCart(String userId, Product product, {int quantity = 1}) async {
    try {
      final cartItem = CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        productId: product.id,
        productName: product.name,
        price: product.price,
        image: product.images.first,
        quantity: quantity,
        sellerId: product.sellerId,
      );

      await _repository.addCartItem(userId, cartItem);
      await loadCart(userId);
      _showSuccess('Added to cart');
    } catch (e) {
      _showError('Failed to add to cart: $e');
    }
  }

  Future<void> updateQuantity(String userId, String itemId, int quantity) async {
    try {
      await _repository.updateCartItemQuantity(userId, itemId, quantity);
      await loadCart(userId);
    } catch (e) {
      _showError('Failed to update quantity: $e');
    }
  }

  Future<void> removeItem(String userId, String itemId) async {
    try {
      await _repository.removeCartItem(userId, itemId);
      await loadCart(userId);
      _showSuccess('Removed from cart');
    } catch (e) {
      _showError('Failed to remove item: $e');
    }
  }

  Future<void> clearCart(String userId) async {
    try {
      await _repository.clearCart(userId);
      cart.value = CartModel.empty(userId);
      _showSuccess('Cart cleared');
    } catch (e) {
      _showError('Failed to clear cart: $e');
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

