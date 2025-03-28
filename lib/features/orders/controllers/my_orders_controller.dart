import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/order_model.dart';

class MyOrdersController extends GetxController {
  static MyOrdersController get to => Get.find();

  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      // Simulated delay to mimic network request
      await Future.delayed(const Duration(seconds: 2));

      // Load dummy orders
      orders.value = _getDummyOrders();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  List<OrderModel> _getDummyOrders() {
    return [
      OrderModel(
        id: 'ORDER001',
        userId: 'mock-user-id',
        items: [
          {
            'productId': 'p1',
            'name': 'Nike Air Max',
            'price': 129.99,
            'quantity': 1,
            'image': 'https://picsum.photos/200',
          },
          {
            'productId': 'p2',
            'name': 'Adidas T-Shirt',
            'price': 29.99,
            'quantity': 2,
            'image': 'https://picsum.photos/201',
          },
        ],
        total: 189.97,
        status: 'processing',
        shippingAddress: '123 Main St',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      OrderModel(
        id: 'ORDER002', 
        userId: 'mock-user-id',
        items: [
          {
            'productId': 'p3',
            'name': 'Apple Watch Series 7',
            'price': 399.99,
            'quantity': 1,
            'image': 'https://picsum.photos/202',
          },
        ],
        total: 399.99,
        status: 'delivered',
        shippingAddress: '456 Oak Ave',
        city: 'Los Angeles',
        state: 'CA',
        zipCode: '90001',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
      OrderModel(
        id: 'ORDER003',
        userId: 'mock-user-id',
        items: [
          {
            'productId': 'p4',
            'name': 'Samsung Galaxy S21',
            'price': 799.99,
            'quantity': 1,
            'image': 'https://picsum.photos/203',
          },
          {
            'productId': 'p5',
            'name': 'Phone Case',
            'price': 19.99,
            'quantity': 1,
            'image': 'https://picsum.photos/204',
          },
        ],
        total: 819.98,
        status: 'pending',
        shippingAddress: '789 Pine St',
        city: 'Chicago',
        state: 'IL',
        zipCode: '60601',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.green;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
