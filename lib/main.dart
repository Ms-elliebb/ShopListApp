import 'package:flutter/material.dart';

import 'pages/login_screen.dart';
import 'pages/register_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title:'ShopList',
   initialRoute: '/',
    routes:{
      '/':(context) => LoginScreen(),
      '/register':(context) => RegisterScreen(),
  },
  );

    ;
  }
}

