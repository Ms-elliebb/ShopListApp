import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/shopping_list_model.dart';
import '../model/item_model.dart';

class SharedPreferencesService {
  static Future<void> saveShoppingLists(List<ShoppingList> lists) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList =
        lists.map((list) => json.encode(list.toJson())).toList();
    prefs.setStringList('shopping_lists', jsonStringList);
  }

  static Future<List<ShoppingList>> getShoppingLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonStringList = prefs.getStringList('shopping_lists');
    if (jsonStringList != null) {
      return jsonStringList
          .map((jsonString) => ShoppingList.fromJson(json.decode(jsonString)))
          .toList();
    }
    return [];
  }

  static Future<void> saveItems(String listId, List<Item> items) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList =
        items.map((item) => json.encode(item.toJson())).toList();
    prefs.setStringList('items_$listId', jsonStringList);
  }

  static Future<List<Item>> getItems(String listId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonStringList = prefs.getStringList('items_$listId');
    if (jsonStringList != null) {
      return jsonStringList
          .map((jsonString) => Item.fromJson(json.decode(jsonString)))
          .toList();
    }
    return [];
  }
}
