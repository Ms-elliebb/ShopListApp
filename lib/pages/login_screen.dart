import 'package:flutter/material.dart';

/// LoginScreen displays a login form allowing users to enter their credentials.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background for better visibility.
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'KULLANICI GİRİŞ',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.red[900], // Dark red color for the AppBar.
        elevation: 0, // No shadow for a cleaner look.
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Image.asset(
                  'lib/images/marketcaar.png',
                  height: 220,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  icon: Icon(
                    Icons.email,
                    color: Colors.red[300],
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  icon: Icon(
                    Icons.lock,
                    color: Colors.red[300],
                  ),
                ),
                obscureText: true, // Obscures text for security.
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Login action: Navigate to the home page after login.
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900], // Consistent button color with AppBar.
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Giriş yap',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to the registration page if the user needs to create an account.
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Hesabınız yok mu? Kaydolun.',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

