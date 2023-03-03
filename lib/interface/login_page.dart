import 'package:demo/demo_injection.dart';
import 'package:demo/domain/home_provider.dart';
import 'package:demo/domain/login_provider.dart';
import 'package:demo/interface/widget/modal_generica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset("assets/images/imagen.png"),
              ),
              ValueListenableBuilder(
                valueListenable: provider.userController,
                builder: (context, userController, child) => Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: userController,
                    cursorColor: Colors.lightGreen,
                    decoration: const InputDecoration(
                      labelText: "Usuario",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      icon: Icon(Icons.account_circle, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.lightGreen),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.lightGreen),
                      ),
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: provider.passwdController,
                builder: (context, passwdController, child) => Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    obscureText: true,
                    controller: passwdController,
                    cursorColor: Colors.lightGreen,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      icon: Icon(Icons.lock, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.lightGreen),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.lightGreen),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(40),
                child: TextButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(size.width, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
                  onPressed: () {
                    final res = provider.login(
                      user: provider.userController.value.text,
                      passwd: provider.passwdController.value.text,
                    );
                    if (res) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeInjection.injection(),
                      ));
                    } else {
                      ModalGenerica(context: context, title: "Advertencia", content: "Login Incorrecto").show();
                    }
                  },
                  child: const Text("Ingresar", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text("CRM - Baguer v1.7.67", style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
