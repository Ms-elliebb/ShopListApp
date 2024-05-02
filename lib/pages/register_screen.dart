import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Kayıt  Ol'),
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ad Soyad',

                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-Posta',

                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Şifre',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed:() {
                //kayıt olma işlemleri
              },
               child: const Text('Kayıt ol'),
               ),
               TextButton(onPressed:() {
                 Navigator.pop(context);

               },
                child: const Text('Giriş yapmak için buraya tıklayın'),
              ),
            ],
            ),
            ),
    );
  }
}