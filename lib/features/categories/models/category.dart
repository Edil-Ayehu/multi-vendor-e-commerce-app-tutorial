import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final int itemCount; // Mock item count for UI display

  Category({
    required this.name,
    required this.icon,
    required this.color,
    this.itemCount = 0, // Default value
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon,
      'color': color,
    };
  }
}
