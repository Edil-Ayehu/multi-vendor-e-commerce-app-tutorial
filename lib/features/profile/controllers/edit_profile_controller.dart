import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'dart:convert';

class EditProfileController extends GetxController {
  final cloudName = 'dugwwgbaz';
  final _imageFile = Rx<File?>(null);
  final _isLoading = false.obs;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  File? get imageFile => _imageFile.value;
  bool get isLoading => _isLoading.value;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get locationController => _locationController;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.onClose();
  }

  void loadUserData() {
    _nameController.text = 'John Doe';
    _phoneController.text = '+24393949333';
    _locationController.text = 'NYC';
  }

  Future<void> pickImage() async {
    try {
      final status = await Permission.photos.status;
      if (status.isDenied) {
        final result = await Permission.photos.request();
        if (result.isDenied || result.isPermanentlyDenied) {
          Get.snackbar(
            'Permission Required',
            'Please enable gallery access in app settings',
            duration: const Duration(seconds: 5),
            mainButton: TextButton(
              onPressed: () => openAppSettings(),
              child: const Text('Open Settings', style: TextStyle(color: Colors.white)),
            ),
          );
          return;
        }
      }

      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
      );

      if (pickedFile != null) {
        _imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<String?> _uploadImageToCloudinary(File imageFile) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'multi-vendor-ecommerce-app'
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            imageFile.path,
            filename: path.basename(imageFile.path),
          ),
        );

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonData = jsonDecode(responseString);
        return jsonData['secure_url'];
      }
      return null;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> updateProfile() async {
    _isLoading.value = true;
    try {
      String? imageUrl;
      if (_imageFile.value != null) {
        imageUrl = await _uploadImageToCloudinary(_imageFile.value!);
      }

      // TODO: Implement profile update logic
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay

      Get.back();
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}