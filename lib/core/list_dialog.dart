
import 'package:flutter/material.dart';

/// Shows a dialog to add a new shopping list.
void showAddListDialog(BuildContext context, Function(String) addListCallback) {
  TextEditingController listNameController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Yeni Liste Oluştur"),
        content: TextField(
          controller: listNameController,
          decoration: InputDecoration(labelText: "Liste Adı"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "İptal",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextButton(
              onPressed: () {
                String listName = listNameController.text;
                addListCallback(listName);
                Navigator.of(context).pop();
              },
              child: Text(
                "Kaydet",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
