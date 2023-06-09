import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final Map<String, dynamic> localizedNames;
  final String icon;
  final List<Category>? subcategories;

  String get localizedName =>
      localizedNames[WidgetsBinding.instance.window.locale.languageCode] ??
      toBeginningOfSentenceCase(name);

  Category({
    required this.id,
    required this.name,
    required this.localizedNames,
    required this.icon,
    this.subcategories,
  });

  Category copyWith({
    int? id,
    String? name,
    String? icon,
    List<Category>? subcategories,
    Map<String, dynamic>? localizedNames,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      localizedNames: localizedNames ?? this.localizedNames,
      icon: icon ?? this.icon,
      subcategories: subcategories ?? this.subcategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'subcategories': subcategories?.map((x) => x.toMap()).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      localizedNames: map['localized_names'],
      icon: map['icon'] ?? '',
      subcategories: map['subcategories'] != null
          ? List<Category>.from(
              map['subcategories']?.map((x) => Category.fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, icon: $icon, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.icon == icon &&
        listEquals(other.subcategories, subcategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ icon.hashCode ^ subcategories.hashCode;
  }
}
