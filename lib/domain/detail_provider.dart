import 'package:flutter/material.dart';

import 'model/demo_response_model.dart';

class DetailProvider with ChangeNotifier {
  final userData = ValueNotifier<DemoResponseModel>(DemoResponseModel());

  void onInit({required DemoResponseModel user}) {
    userData.value = user;
    notifyListeners();
  }
}
