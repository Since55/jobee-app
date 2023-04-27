class UserData {
  final int id;
  final String email;
  final String? name;
  final String userId;
  final String? image;
  final String? phone;
  final DateTime createdAt;

  UserData({
    required this.id,
    required this.email,
    this.name,
    required this.userId,
    this.image,
    this.phone,
    required this.createdAt,
  });

  UserData copyWith({
    int? id,
    String? email,
    String? name,
    String? userId,
    String? image,
    String? phone,
    DateTime? createdAt,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'user_id': userId,
      'image': image,
      'phone': phone,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      name: map['name'],
      userId: map['user_id'] ?? '',
      image: map['image'],
      phone: map['phone'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  String toString() {
    return 'UserData(id: $id, email: $email, name: $name, userId: $userId, image: $image, phone: $phone, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.userId == userId &&
        other.image == image &&
        other.phone == phone &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        userId.hashCode ^
        image.hashCode ^
        phone.hashCode ^
        createdAt.hashCode;
  }
}
