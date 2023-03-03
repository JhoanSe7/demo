import 'package:demo/demo_injection.dart';
import 'package:demo/external/demo_api.dart';
import 'package:flutter/material.dart';

import 'model/demo_response_model.dart';

class HomeProvider with ChangeNotifier {
  final listUser = ValueNotifier<List<Widget>>([]);

  Future<void> onInit({required BuildContext context}) async {
    List<DemoResponseModel> res = await DemoApi().getUser(cantidad: 10, pais: "es");

    final lista = res
        .map(
          (e) => Card(
            child: ListTile(
              leading: Image.network(e.imageSmall ?? ""),
              title: Text("${e.nombre ?? ""} ${e.apellido ?? ""}"),
              trailing: IconButton(
                splashColor: Colors.lightGreen.withOpacity(.5),
                icon: const Icon(Icons.person_outline),
                iconSize: 30,
                onPressed: () => showDetails(context, e),
              ),
            ),
          ),
        )
        .toList();

    listUser.value.addAll(lista);

    notifyListeners();
  }

  void showDetails(BuildContext context, DemoResponseModel data) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailInjection.injection(data),
    ));
  }
}
