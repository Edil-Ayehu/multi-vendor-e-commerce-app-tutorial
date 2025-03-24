import 'package:flutter/material.dart';

class ProductFilterDialog extends StatefulWidget {
  final RangeValues initialPriceRange;
  final String? initialCategory;
  final List<Map<String, dynamic>> categories;
  final Function(RangeValues, String?) onApply;
  final VoidCallback onReset;

  const ProductFilterDialog({
    super.key,
    required this.initialPriceRange,
    required this.initialCategory,
    required this.categories,
    required this.onApply,
    required this.onReset,
  });

  static Future<void> show({
    required BuildContext context,
    required RangeValues initialPriceRange,
    required String? initialCategory,
    required List<Map<String, dynamic>> categories,
    required Function(RangeValues, String?) onApply,
    required VoidCallback onReset,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ProductFilterDialog(
        initialPriceRange: initialPriceRange,
        initialCategory: initialCategory,
        categories: categories,
        onApply: onApply,
        onReset: onReset,
      ),
    );
  }

  @override
  State<ProductFilterDialog> createState() => _ProductFilterDialogState();
}

class _ProductFilterDialogState extends State<ProductFilterDialog> {
  late RangeValues _tempPriceRange;
  String? _tempCategory;

  @override
  void initState() {
    super.initState();
    _tempCategory = widget.initialCategory;
    _tempPriceRange = widget.initialPriceRange;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Price Range',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            RangeSlider(
              values: _tempPriceRange,
              min: 0,
              max: 1000,
              divisions: 100,
              labels: RangeLabels(
                '\$${_tempPriceRange.start.round()}',
                '\$${_tempPriceRange.end.round()}',
              ),
              onChanged: (values) {
                setState(() => _tempPriceRange = values);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              value: _tempCategory,
              dropdownColor: isDark ? Colors.grey[850] : Colors.white,
              items: [
                DropdownMenuItem<String>(
                  value: null,
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ),
                ...widget.categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['name'],
                    child: Text(
                      category['name'],
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  );
                }).toList(),
              ],
              onChanged: (value) {
                setState(() => _tempCategory = value);
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      widget.onReset();
                      Navigator.pop(context);
                    },
                    label: const Text('Reset'),
                    icon: const Icon(
                      Icons.refresh,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      backgroundColor:
                          isDark ? Colors.grey[800] : Colors.grey[100],
                      foregroundColor: isDark ? Colors.white70 : Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      widget.onApply(_tempPriceRange, _tempCategory);
                      Navigator.pop(context);
                    },
                    label: const Text('Apply'),
                    icon: const Icon(
                      Icons.check,
                    ),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
