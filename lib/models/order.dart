class Order {
  final int? id;
  final num? price;
  final bool active;
  final String userId;
  final int categoryId;
  final String icon;
  final String title;
  final String userName;
  final String location;
  final String description;
  final DateTime? deadline;
  final DateTime createdAt;

  Order({
    this.active = true,
    this.id,
    required this.userId,
    required this.categoryId,
    required this.icon,
    required this.title,
    required this.userName,
    required this.location,
    required this.description,
    this.deadline,
    this.price,
    required this.createdAt,
  });

  Order copyWith({
    int? id,
    String? userId,
    int? categoryId,
    String? icon,
    String? title,
    String? userName,
    String? location,
    String? description,
    DateTime? deadline,
    DateTime? createdAt,
    num? price,
    bool? active,
  }) {
    return Order(
      id: id ?? this.id,
      active: active ?? this.active,
      price: price ?? this.price,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      userName: userName ?? this.userName,
      location: location ?? this.location,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'category_id': categoryId,
      'icon': icon,
      'price': price,
      'title': title,
      'user_name': userName,
      'location': location,
      'description': description,
      'active': active,
      'deadline': deadline?.toString(),
      'created_at': createdAt.toString(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      active: map['active'] as bool,
      id: map['id']?.toInt() ?? 0,
      userId: map['user_id'],
      price: map['price'],
      categoryId: map['category_id']?.toInt() ?? 0,
      icon: map['icon'] ?? '',
      title: map['title'] ?? '',
      userName: map['user_name'] ?? '',
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      deadline:
          map['deadline'] != null ? DateTime.tryParse(map['deadline']) : null,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, categoryId: $categoryId, icon: $icon, title: $title, userName: $userName, location: $location, description: $description, deadline: $deadline, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.categoryId == categoryId &&
        other.icon == icon &&
        other.title == title &&
        other.userName == userName &&
        other.location == location &&
        other.description == description &&
        other.deadline == deadline &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        categoryId.hashCode ^
        icon.hashCode ^
        title.hashCode ^
        userName.hashCode ^
        location.hashCode ^
        description.hashCode ^
        deadline.hashCode ^
        createdAt.hashCode;
  }
}
