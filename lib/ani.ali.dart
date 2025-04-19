import 'package:ani_con/models/esfera.dart';
import 'package:ani_con/widgets/esfera.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Esfera> esferas = [];
  int contador = 0;

  void agregarEsfera() {
    final esfera = Esfera.random();
    setState(() {
      esferas.add(esfera);
    });
  }

  void eliminarEsfera(String id) {
    setState(() {
      esferas.removeWhere((e) => e.id == id);
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recolectadas: $contador'),
      ),
      body: Stack(
        children: esferas
            .map((e) => MovingSphere(
                  key: ValueKey(e.id),
                  esfera: e,
                  onTap: () => eliminarEsfera(e.id),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarEsfera,
        child: Icon(Icons.add),
      ),
    );
  }
}
