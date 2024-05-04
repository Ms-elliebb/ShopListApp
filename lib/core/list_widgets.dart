
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_list/pages/listPage.dart';


/// Builds the list of shopping lists with interactive slides.
Widget buildShoppingList(List<String> shoppingLists, Function(int) onDelete, Function(int) onEdit) {
  return ListView.builder(
    itemCount: shoppingLists.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(title: shoppingLists[index]),
            ),
          );
        },
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(shoppingLists[index]),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          actions: [
            IconSlideAction(
              caption: 'Edit',
              color: Colors.blue,
              icon: Icons.edit,
              onTap: () => onEdit(index),
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => onDelete(index),
            ),
          ],
        ),
      );
    },
  );
}