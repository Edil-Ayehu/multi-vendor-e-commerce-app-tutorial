import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterTap;
  final bool isSeaching;
  
  const HomeSearchBar({
    super.key, 
    required this.searchQuery, 
    required this.onSearchChanged, 
    required this.onFilterTap, 
    required this.isSeaching,
    });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search Products...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                suffixIcon: isSeaching ? 
                IconButton(
                  onPressed: ()=> onSearchChanged(''), 
                  icon: Icon(
                    Icons.clear,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  ): null
              ),
              onChanged: onSearchChanged,
            ),
          ),
          if(!isSeaching)
          IconButton(
            onPressed: onFilterTap, 
            icon: Icon(
              Icons.filter_list,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
            ),
        ],
      ),
    );
  }
}