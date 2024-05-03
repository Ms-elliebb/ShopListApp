import 'package:flutter/material.dart';
import 'package:shopping_list/pages/home_page.dart';

import 'pages/login_screen.dart';
import 'pages/register_screen.dart';


void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Uygulama',
    
   initialRoute: '/',
    routes:{
      '/':(context) => const LoginScreen(),
      '/register':(context) => const RegisterScreen(),
      '/home':(context) => const HomePage(),
  },
  );

    
  }
}

