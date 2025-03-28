class OrderModel {
  final String id;
  final String userId;
  final List<Map<String, dynamic>> items;
  final double total;
  final String status;
  final String shippingAddress;
  final String city;
  final String state;
  final String zipCode;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.shippingAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'items': items,
      'total': total,
      'status': status,
      'shippingAddress': shippingAddress,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      items: List<Map<String, dynamic>>.from(map['items'] ?? []),
      total: (map['total'] ?? 0.0).toDouble(),
      status: map['status'] ?? 'pending',
      shippingAddress: map['shippingAddress'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zipCode'] ?? '',
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}