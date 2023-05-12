import 'dart:convert';

class Application {
  final int? id;
  final int orderId;
  final String userId;
  final DateTime? createdAt;
  final String? text;
  final num? price;
  final String contacts;
  final String forUserId;

  Application({
    this.id,
    required this.orderId,
    required this.userId,
    required this.forUserId,
    this.createdAt,
    this.text,
    this.price,
    required this.contacts,
  });

  Application copyWith({
    int? id,
    int? orderId,
    String? userId,
    String? forUserId,
    DateTime? createdAt,
    String? text,
    num? price,
    String? contacts,
  }) {
    return Application(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      forUserId: forUserId ?? this.forUserId,
      createdAt: createdAt ?? this.createdAt,
      text: text ?? this.text,
      price: price ?? this.price,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'order_id': orderId,
      'user_id': userId,
      'for_user_id': forUserId,
      if (createdAt != null) 'created_at': createdAt?.toString(),
      'text': text,
      'price': price,
      'contacts': contacts,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id']?.toInt(),
      orderId: map['order_id']?.toInt() ?? 0,
      userId: map['user_id'] ?? '',
      forUserId: map['for_user_id'] ?? '',
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      text: map['text'],
      price: map['price'],
      contacts: map['contacts'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Application(id: $id, orderId: $orderId, userId: $userId, createdAt: $createdAt, text: $text, price: $price, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Application &&
        other.id == id &&
        other.orderId == orderId &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.text == text &&
        other.price == price &&
        other.contacts == contacts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderId.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        text.hashCode ^
        price.hashCode ^
        contacts.hashCode;
  }
}
