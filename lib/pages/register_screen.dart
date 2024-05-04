import 'package:flutter/material.dart';

/// RegisterScreen provides a user interface for users to create a new account.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'), // Title for the registration screen.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ad Soyad', // Label for the full name field.
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-Posta', // Label for the email field.
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Şifre', // Label for the password field.
              ),
              obscureText: true, // Ensures the password is obscured for security.
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Registration logic to be implemented.
              },
              child: const Text('Kayıt ol'), // Button to submit the registration form.
            ),
            TextButton(
              onPressed: () {
                // Provides an option to navigate back to the login screen.
                Navigator.pop(context);
              },
              child: const Text('Giriş yapmak için buraya tıklayın'), // Text button for navigating to the login screen.
            ),
          ],
        ),
      ),
    );
  }
}
