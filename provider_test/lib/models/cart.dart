import 'package:flutter/foundation.dart';
import 'package:provider_test/models/menu.dart';

class CartModel extends ChangeNotifier {
  late MenuModel _menu;

  final List<int> _itemIds = [];

  MenuModel get menu => _menu;

  set menu(MenuModel newMenu) {
    _menu = newMenu;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _menu.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
