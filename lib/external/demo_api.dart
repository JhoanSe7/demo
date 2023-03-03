import 'dart:convert';

import 'package:demo/domain/model/demo_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoApi {
  Future<dynamic> getUser({required int cantidad, required String pais}) async {
    String url = "https://randomuser.me/api/?results=$cantidad&nat=$pais";
    List<DemoResponseModel> data = [];
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": 'application/json',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> bodyList = jsonDecode(utf8.decode(response.bodyBytes))["results"];
        data = List<DemoResponseModel>.from(bodyList.map((e) => DemoResponseModel.fromJson(e)));
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return data;
  }
}
