import 'package:flutter/material.dart';

class MenuModel {
  static List<String> items = [
    'Gas Gallon Type 1',
    'Gas Gallon Type 2',
    'Gas Gallon Type 3',
    'Gas Gallon Type 4'
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
