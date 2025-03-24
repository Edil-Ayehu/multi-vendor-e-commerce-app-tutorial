import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Function(BuildContext) onViewAllTap;
  
  const CategoriesSection({
    super.key, 
    required this.categories, 
    required this.onViewAllTap,
    });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          height: 120,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index){
              final category = categories[index];
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        border: isDark ? Border.all(
                          color: category['color'].withOpacity(0.3)
                        ): null,
                        boxShadow: [
                          BoxShadow(
                            color: isDark ? Colors.black12 : category['color'].withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(20),
                          child: Icon(
                            category['icon'],
                            size: 30,
                            color: isDark ? category['color'].withOpacity(0.3) : category['color'],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
            ),
        ),
      ],
    );
  }
}