import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Kayıt  Ol'),
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ad Soyad',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-Posta',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Şifre',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed:() {
                //kayıt olma işlemleri
              },
               child: Text('Kayıt ol'),
               ),
               TextButton(onPressed:() {
                 Navigator.pop(context);

               },
                child: Text('Giriş yapmak için buraya tıklayın'),
              ),
            ],
            ),
            ),
    );
  }
}