class ProductDto {
  final String id;
  final String name;
  final double price;
  final String? description;
  final DateTime? createdAt;
  final String? userId;

  ProductDto({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.createdAt,
    this.userId,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
    };
  }
}