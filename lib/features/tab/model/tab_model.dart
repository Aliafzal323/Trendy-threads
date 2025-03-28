import 'package:flutter/material.dart';

enum TabItem {
  home(Icons.home),
  search(Icons.store_outlined),
  favoriteItems(Icons.favorite_outline),
  person(Icons.person_2_outlined);

  const TabItem(this.icon);

  final IconData icon;
  String get title {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.search:
        return 'Store';
      case TabItem.favoriteItems:
        return 'Favorites';
      case TabItem.person:
        return 'Profile';
      default:
        return '';
    }
  }

  static const List<TabItem> items = [
    home,
    search,
    favoriteItems,
    person,
  ];
}
