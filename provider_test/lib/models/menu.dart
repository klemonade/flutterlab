import 'package:flutter/material.dart';

class MenuModel {
  static List<String> items = [
    'I like you cause you got that somethin',
    'That I need in my life so give it to me',
    'Cause you got that',
    'Like you cause you got that somethin',
    'That I need in my life, that I need, so',
    'Cause you got that',
  ];

  Item getById(int id) => Item(id, items[id % items.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;

  const Item(this.id, this.name);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
