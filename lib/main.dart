import 'package:flutter/material.dart';
import 'pages/login_screen.dart';
import 'pages/register_screen.dart';
import 'pages/home_page.dart';
import 'pages/listPage.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp is the main application widget that defines the route and basic UI properties.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disables the debug banner for cleaner UI.
      title: 'Uygulama', // Title of the application.
      initialRoute: '/', // Defines the initial route of the application.
      routes: {
        '/': (context) => const LoginScreen(), // Route for the login screen.
        '/register': (context) => const RegisterScreen(), // Route for the registration screen.
        '/home': (context) => const HomePage(), // Route for the home page.
        '/list': (context) => const ListPage(title: '',), // Route for the list page.
      },
    );
  }
}

