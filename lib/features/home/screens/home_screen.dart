import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/ads_section.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/app_drawer.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/categories_section.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/home_app_bar.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/home_search_bar.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/personalized_recommendations.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/product_card.dart';
import 'package:multi_vendor_ecommerce_application/features/home/widgets/product_filter_dialog.dart';
import 'package:multi_vendor_ecommerce_application/features/products/models/product_model.dart';
import 'package:multi_vendor_ecommerce_application/features/products/screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  bool get _isSearching => _searchQuery.isNotEmpty;
  bool get _isFiltering =>
      _priceRange != RangeValues(0, 1000) || _selectedCategory != null;
  RangeValues _priceRange = RangeValues(0, 1000);
  String? _selectedCategory;

  // sample category data
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'icon': Icons.devices, 'color': Colors.blue},
    {'name': 'Fashion', 'icon': Icons.shopping_bag, 'color': Colors.pink},
    {'name': 'Books', 'icon': Icons.book, 'color': Colors.green},
    {'name': 'Sports', 'icon': Icons.sports_soccer, 'color': Colors.orange},
  ];

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Adidas Shoes',
      description: 'Latest smartphone with amazing features',
      price: 699.99,
      images: [
        'https://i.ebayimg.com/images/g/~ssAAOSw60JmlqDG/s-l400.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy8Reb18192K1ewlvSPUUAFlHPnCt-APTSkeTdV46upRvafIM7_k8ZgtLEMkYUVN5X-HU&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEx4CxhtkxMtIfnEQgOYKPT03ntg2_WelaRbdF1DyoRHNFQ2xi6h3uDNuQ_7zfX_-NEVw&usqp=CAU'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 4,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '2',
      name: 'HP Laptop',
      description: 'Latest smartphone with amazing features',
      price: 699.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Gq8VKEr24Fnt6SiLCnJL7hTT6glOrITeow&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 4,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '3',
      name: 'T-Shirt',
      description: 'Latest smartphone with amazing features',
      price: 699.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL3AOoCcmlKa0RBiyyE7zxU8GLB8n7DhxtzQ&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRENoxb3-9yQd7WuscWtsjXvhhZOUBwCJ1GvA&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 4,
      createdAt: DateTime.now(),
    ),
    Product(
      id: '4',
      name: 'iPhone',
      description: 'Latest smartphone with amazing features',
      price: 699.99,
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjwgZPisu_ug90uxfRaZw6C_U5UvHwYBx3QQ&s'
      ],
      category: 'Electronics',
      sellerId: '1',
      stock: 4,
      createdAt: DateTime.now(),
    ),
  ];

  void _showFilterDialog() {
    ProductFilterDialog.show(
        context: context,
        initialPriceRange: _priceRange,
        initialCategory: _selectedCategory,
        categories: categories,
        onApply: (priceRange, category) {
          setState(() {
            _priceRange = priceRange;
            _selectedCategory = category;
          });
        },
        onReset: () {
          setState(() {
            _priceRange = const RangeValues(0, 1000);
            _selectedCategory = null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const HomeAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              HomeSearchBar(
                searchQuery: _searchQuery,
                isSeaching: _isSearching,
                onSearchChanged: (value) {
                  setState(() => _searchQuery = value);
                },
                onFilterTap: _showFilterDialog,
              ),
              if(_isSearching || _isFiltering) ...[
                const SizedBox(height: 20),
                _buildProductGrid(isDark),

              ] else ...[
                const SizedBox(height: 20),
                CategoriesSection(
                categories: categories,
                onViewAllTap: (context) {},
              ),

              // ads section
              const AdsSection(),

              // personalized recommendations
              const PersonalizedRecommendations(),
              const SizedBox(height: 20),
              _buildSectionTitle(
                'Popular Products',
                true,
                onViewAllTap: () {},
              ),
              const SizedBox(height: 10),
              _buildProductGrid(isDark),
              ],




            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(bool isDark) {
    if (_isSearching || _isFiltering) {
      // filter products based on search and filters
      final filteredProducts = products.where((product) {
        final matchesSearch = _searchQuery.isEmpty ||
            product.name.toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesPrice = product.price >= _priceRange.start &&
            product.price <= _priceRange.end;
        final matchesCategory =
            _selectedCategory == null || product.category == _selectedCategory;
        return matchesSearch && matchesPrice && matchesCategory;
      }).toList();

      return _buildProductGridView(filteredProducts, isDark);
    }

    return _buildProductGridView(products, isDark);
  }

  Widget _buildProductGridView(List<Product> products, bool isDark) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
        childAspectRatio: MediaQuery.of(context).size.width < 400 ? 0.7 : 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        name: products[index].name,
        price: products[index].price,
        imageUrl: products[index].images[0],
        onTap: () => Get.to(() => ProductDetailsScreen(product: products[index])),
        onCarTap: () {},
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool hasViewAll,
      {required VoidCallback onViewAllTap}) {
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
        if (hasViewAll)
          TextButton(
            onPressed: onViewAllTap,
            child: Text(
              'View All',
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
      ],
    );
  }
}
