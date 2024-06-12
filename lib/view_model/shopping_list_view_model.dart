import 'package:flutter/material.dart';
import '../model/shopping_list_model.dart';
import '../services/shared_preferences_service.dart';

class ShoppingListViewModel extends ChangeNotifier {
  List<ShoppingList> _shoppingLists = [];

  List<ShoppingList> get shoppingLists => _shoppingLists;

  ShoppingListViewModel() {
    _loadShoppingLists();
  }

  Future<void> _loadShoppingLists() async {
    _shoppingLists = await SharedPreferencesService.getShoppingLists();
    notifyListeners();
  }

  Future<void> addShoppingList(ShoppingList list) async {
    _shoppingLists.add(list);
    await SharedPreferencesService.saveShoppingLists(_shoppingLists);
    notifyListeners();
  }
}
