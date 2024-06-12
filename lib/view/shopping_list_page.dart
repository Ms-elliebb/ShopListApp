import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/shopping_list_view_model.dart';
import '../model/shopping_list_model.dart';
import 'items_page.dart';

class ShoppingListPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ShoppingListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Lists'),
      ),
      body: ListView.builder(
        itemCount: viewModel.shoppingLists.length,
        itemBuilder: (context, index) {
          final list = viewModel.shoppingLists[index];
          return ListTile(
            title: Text(list.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => ItemsViewModel(listId: list.id),
                    child: ItemsPage(),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddListDialog(context, viewModel);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddListDialog(
      BuildContext context, ShoppingListViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Shopping List'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'List name'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                final name = _controller.text;
                if (name.isNotEmpty) {
                  final list = ShoppingList(
                    id: DateTime.now().toString(),
                    name: name,
                  );
                  viewModel.addShoppingList(list);
                  _controller.clear();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
