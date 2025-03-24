import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/wishlist/screens/wishlist_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      title: Text(
        'E-Shop',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () => Get.to(() => const WishlistScreen()),
              icon: Icon(
                Icons.favorite,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minHeight: 16,
                  minWidth: 16,
                ),
                child: const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ),
          ],
        ),
      ],
    );
  }
}
