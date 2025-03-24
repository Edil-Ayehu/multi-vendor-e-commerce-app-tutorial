import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/product_card.dart';
import 'package:multi_vendor_ecommerce_application/features/products/models/product_model.dart';
import 'package:multi_vendor_ecommerce_application/features/products/screens/product_details_screen.dart';

class PersonalizedRecommendations extends StatelessWidget {
  const PersonalizedRecommendations({super.key});

  // dummy recommended products 
  static final List<Product> recommendedProducts = [
        Product(
      id: 'rec1',
      name: 'Wireless Earbuds',
      description: 'High-quality wireless earbuds with noise cancellation',
      price: 129.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCl78pwgs0Fhzb6QWfZYY9HWYLtwpTXaEKg&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 10,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec2',
      name: 'Smart Watch',
      description: 'Feature-rich smartwatch with health tracking',
      price: 199.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRycJFC-K_NUePTxMzv8IK4t35M69QY_Un3iA&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 15,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec3',
      name: 'Running Shoes',
      description: 'Comfortable running shoes for athletes',
      price: 89.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy8Reb18192K1ewlvSPUUAFlHPnCt-APTSkeTdV46upRvafIM7_k8ZgtLEMkYUVN5X-HU&usqp=CAU'
      ],
      category: 'Sports',
      sellerId: '1',
      stock: 20,
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'rec4',
      name: 'Backpack',
      description: 'Durable backpack for everyday use',
      price: 49.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEx4CxhtkxMtIfnEQgOYKPT03ntg2_WelaRbdF1DyoRHNFQ2xi6h3uDNuQ_7zfX_-NEVw&usqp=CAU'
      ],
      category: 'Fashion',
      sellerId: '1',
      stock: 25,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          'Recommended for you',
          context,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedProducts.length,
            itemBuilder: (context, index){
              final product = recommendedProducts[index];
              return SizedBox(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ProductCard(
                    name: product.name,
                    price: product.price,
                    imageUrl: product.images[0],
                    onTap: ()=> Get.to(() => ProductDetailsScreen(product: product)),
                    onCarTap: (){},
                    useResponsiveFont: false,
                  ),
                  ),
              );
            },
            ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}