import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Giriş Yap'),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            TextFormField(
              decoration:InputDecoration(
                labelText:'E-posta',
              ),
            ),
          TextFormField(
            decoration: InputDecoration(
              labelText:'Şifre',
              ),
              obscureText: true,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            // Giriş yapma işlemleri
          }, child: Text('Giriş yap'),
          ),
          TextButton(onPressed:() {
            Navigator.pushNamed(context, '/register');
          }, child: Text('Hesabınız yok mu? Kaydolun'),
          ),
          ],
        ),
        ),  
    );
  }
}