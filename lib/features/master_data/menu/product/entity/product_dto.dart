class ProductDto {
  final String? id;
  final String name;
  final double price;
  final bool? status;
  final String? description;
  final DateTime? createdAt;
  final String? userId;

  ProductDto({
    this.id,
    required this.name,
    required this.price,
    this.status,
    this.description,
    this.createdAt,
    this.userId,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String?,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as bool?,
      description: json['description'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'id': id,
      'name': name,
      'price': price,
      'status': status,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }
}