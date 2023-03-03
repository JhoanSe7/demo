import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final userController = ValueNotifier<TextEditingController>(TextEditingController());
  final passwdController = ValueNotifier<TextEditingController>(TextEditingController());
  final listUser = ValueNotifier<List<Widget>>([]);
  String usuario = "user";
  String clave = "1234";

  void onInit() {
    userController.value.text = usuario;
    passwdController.value.text = clave;
    notifyListeners();
  }

  bool login({required String user, required String passwd}) {
    if (usuario == userController.value.text && clave == passwdController.value.text) {
      return true;
    }
    return false;
  }
}
