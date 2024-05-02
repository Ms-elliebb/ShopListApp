import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top:15.0),
            child: Text(
              'KULLANICI GİRİŞ',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: 
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: Image.asset('lib/images/marketcaar.png',
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
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Giriş yapma işlemleri
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:   Colors.red[900],
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text(
                      'Giriş yap',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
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
