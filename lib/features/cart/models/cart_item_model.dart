class CartItem {
  final String id;
  final String productId;
  final String productName;
  final double price;
  final String image;
  final int quantity;
  final String sellerId;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.quantity,
    required this.sellerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'image': image,
      'quantity': quantity,
      'sellerId': sellerId,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      productId: map['productId'],
      productName: map['productName'],
      price: map['price'].toDouble(),
      image: map['image'],
      quantity: map['quantity'],
      sellerId: map['sellerId'],
    );
  }
}