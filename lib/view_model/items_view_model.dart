import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../services/shared_preferences_service.dart';

class ItemsViewModel extends ChangeNotifier {
  List<Item> _items = [];
  String listId;

  List<Item> get items => _items;

  ItemsViewModel({required this.listId}) {
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await SharedPreferencesService.getItems(listId);
    notifyListeners();
  }

  Future<void> addItem(Item item) async {
    _items.add(item);
    await SharedPreferencesService.saveItems(listId, _items);
    notifyListeners();
  }
}
