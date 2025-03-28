import 'package:get/get.dart';
import '../repositories/wishlist_repository.dart';
import '../../products/models/product_model.dart';
import '../../../core/common/utils/toast_utils.dart';

class WishlistController extends GetxController {
  static WishlistController get to => Get.find();
  
  final WishlistRepository _repository;
  final RxList<Product> wishlistItems = <Product>[].obs;

  WishlistController({required WishlistRepository repository})
      : _repository = repository;

  @override
  void onInit() {
    super.onInit();
    refreshWishlist();
  }

  Future<void> toggleWishlist(Product product) async {
    try {
      final userId = 'mock-user-id';
      if (userId == null) {
        _showError('Please sign in to manage wishlist');
        return;
      }

      final isInWishlist = await _repository.isInWishlist(userId, product.id);
      
      if (isInWishlist) {
        await _repository.removeFromWishlist(userId, product.id);
        _showSuccess('Removed from wishlist');
      } else {
        await _repository.addToWishlist(userId, product);
        _showSuccess('Added to wishlist');
      }

      await refreshWishlist();
    } catch (e) {
      _showError('Failed to update wishlist: $e');
    }
  }

  Future<void> refreshWishlist() async {
    try {
      final userId = 'mock-user-id';
      if (userId == null) return;

      final items = await _repository.getWishlistItems(userId);
      wishlistItems.value = items;
    } catch (e) {
      _showError('Failed to load wishlist: $e');
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
