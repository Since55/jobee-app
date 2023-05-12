import 'dart:convert';

class Application {
  final int? id;
  final int orderId;
  final String userId;
  final DateTime? createdAt;
  final String? text;
  final num? price;
  final String contacts;
  final String userName;
  final String forUserId;

  Application({
    this.id,
    required this.orderId,
    required this.userId,
    this.createdAt,
    this.text,
    this.price,
    required this.contacts,
    required this.userName,
    required this.forUserId,
  });

  Application copyWith({
    int? id,
    int? orderId,
    String? userId,
    DateTime? createdAt,
    String? text,
    num? price,
    String? contacts,
    String? userName,
    String? forUserId,
  }) {
    return Application(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      text: text ?? this.text,
      price: price ?? this.price,
      contacts: contacts ?? this.contacts,
      userName: userName ?? this.userName,
      forUserId: forUserId ?? this.forUserId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'order_id': orderId,
      'user_id': userId,
      if (createdAt != null) 'created_at': createdAt?.millisecondsSinceEpoch,
      'text': text,
      'price': price,
      'contacts': contacts,
      'user_name': userName,
      'for_user_id': forUserId,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id']?.toInt(),
      orderId: map['order_id']?.toInt() ?? 0,
      userId: map['user_id'] ?? '',
      createdAt: DateTime.tryParse(map['created_at']),
      text: map['text'],
      price: map['price'],
      contacts: map['contacts'] ?? '',
      userName: map['user_name'] ?? '',
      forUserId: map['for_user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Application(id: $id, orderId: $orderId, userId: $userId, createdAt: $createdAt, text: $text, price: $price, contacts: $contacts, userName: $userName, forUserId: $forUserId)';
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
        other.contacts == contacts &&
        other.userName == userName &&
        other.forUserId == forUserId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderId.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        text.hashCode ^
        price.hashCode ^
        contacts.hashCode ^
        userName.hashCode ^
        forUserId.hashCode;
  }
}
