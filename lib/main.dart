import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/shopping_list_page.dart';
import 'view_model/shopping_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingListViewModel()),
      ],
      child: MaterialApp(
        title: 'Shopping List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShoppingListPage(),
      ),
    );
  }
}
