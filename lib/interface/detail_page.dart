import 'package:demo/domain/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<DetailProvider>(context).userData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("${res.value.nombre ?? ""} ${res.value.apellido ?? ""}"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Image.network(res.value.imageLarge ?? ""),
              ),
              Card(
                child: ListTile(
                  title: const Text("Usuario"),
                  subtitle: Text(res.value.user ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Genero"),
                  subtitle: Text(res.value.genero ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Celular"),
                  subtitle: Text(res.value.cellphone ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Telefono"),
                  subtitle: Text(res.value.phone ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("E-Mail"),
                  subtitle: Text(res.value.email ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Direccion"),
                  subtitle: Text(res.value.street ?? ""),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Ubicacion"),
                  subtitle: Text("${res.value.country ?? ""}, ${res.value.state ?? ""}, ${res.value.city ?? ""}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
