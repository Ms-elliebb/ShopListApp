import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/items_view_model.dart';
import '../model/item_model.dart';

class ItemsPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ItemsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) {
          final item = viewModel.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.quantity),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context, viewModel);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, ItemsViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Item name'),
              ),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(hintText: 'Quantity'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final quantity = _quantityController.text;
                if (name.isNotEmpty && quantity.isNotEmpty) {
                  final item = Item(
                    id: DateTime.now().toString(),
                    name: name,
                    quantity: quantity,
                  );
                  viewModel.addItem(item);
                  _nameController.clear();
                  _quantityController.clear();
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
