import 'package:demo/demo_injection.dart';
import 'package:demo/domain/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginInjection.injection(),
            )),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: provider.listUser,
          builder: (context, listUser, child) => ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index) => listUser[index],
          ),
        ),
      ),
    );
  }
}
