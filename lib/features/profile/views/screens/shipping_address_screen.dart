import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/core/common/widgets/custom_button.dart';
import 'package:multi_vendor_ecommerce_application/core/config/theme/app_colors.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/controllers/shipping_address_controller.dart';
import 'package:multi_vendor_ecommerce_application/features/profile/models/shipping_address_model.dart';
import '../widgets/shipping_address_form_fields.dart';
import '../widgets/shipping_address_header.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();

  late final ShippingAddressController _controller;
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    _controller = Get.put(ShippingAddressController());
    await _controller.loadAddress();
    if (_controller.address != null) {
      _populateFields(_controller.address!);
    }
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    Get.delete<ShippingAddressController>();
    super.dispose();
  }

  void _populateFields(ShippingAddress address) {
    _streetController.text = address.street;
    _cityController.text = address.city;
    _stateController.text = address.state;
    _zipController.text = address.zipCode;
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    final address = ShippingAddress(
      street: _streetController.text,
      city: _cityController.text,
      state: _stateController.text,
      zipCode: _zipController.text,
    );

    await _controller.saveAddress(address);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shipping Address',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isDark ? Colors.white : Colors.black87,
              ),
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
      ),
      body: Obx(() {
        if (_controller.isAddressLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_controller.address != null) {
          _populateFields(_controller.address!);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShippingAddressHeader(),
                const SizedBox(height: 24),
                ShippingAddressFormFields(
                  streetController: _streetController,
                  cityController: _cityController,
                  stateController: _stateController,
                  zipController: _zipController,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withOpacity(0.3)
                            : Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    text: 'Save Address',
                    onPressed: _saveAddress,
                    isLoading: _controller.isLoading,
                    height: 54,
                    backgroundColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
