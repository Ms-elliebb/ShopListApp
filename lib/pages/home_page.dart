import 'package:flutter/material.dart';
import 'package:shopping_list/core/list_dialog.dart';
import 'package:shopping_list/core/list_widgets.dart';


/// HomePage displays a list of shopping lists and allows user interactions.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> shoppingLists = ['Liste 1', 'Liste 2', 'Liste 3']; // Sample list data.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uygulama Adı',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: Center(
        child: buildShoppingList(
          shoppingLists,
          _handleDelete,
          _handleEdit,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddListDialog(context, _addNewList),
        tooltip: 'Add List',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _handleDelete(int index) {
    setState(() {
      shoppingLists.removeAt(index);
    });
  }

  void _handleEdit(int index) {
    // Implement edit functionality or navigation here
    print('Edit index $index');
  }

  void _addNewList(String listName) {
    setState(() {
      shoppingLists.add(listName);
    });
  }
}