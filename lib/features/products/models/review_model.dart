class Review {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String productId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.productId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'productId': productId,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(), // Store as ISO string instead of Timestamp
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      productId: map['productId'],
      rating: (map['rating'] is int) 
          ? (map['rating'] as int).toDouble() 
          : map['rating'] as double,
      comment: map['comment'],
      createdAt: map['createdAt'] is String 
          ? DateTime.parse(map['createdAt']) 
          : DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
