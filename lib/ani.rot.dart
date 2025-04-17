import 'package:ani_con/paginas/a.dart';
import 'package:ani_con/paginas/b.dart';
import 'package:ani_con/paginas/c.dart';
import 'package:ani_con/paginas/d.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flagMenu = false;
  int animDuration = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedRotation'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: AnimatedRotation(
              turns: flagMenu ? 1 : 0,
              duration: Duration(milliseconds: animDuration),
              child: AnimatedContainer(
                width: flagMenu ? 300 : 0,
                height: flagMenu ? 300 : 0,
                duration: Duration(milliseconds: animDuration),
                child: Stack(
                  children: [
                    nodo(Colors.red, 0, -1, 'A'),
                    nodo(Colors.green, 1, 0, 'B'),
                    nodo(Colors.purple, 0, 1, 'C'),
                    nodo(Colors.pink, -1, 0, 'D'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flagMenu = !flagMenu;
          });
        },
        child: Icon(Icons.menu),
      ),
    );
  }

  Widget nodo(Color color, double fila, double columna, msg) {
    return Align(
      alignment: Alignment(fila, columna),
      child: GestureDetector(
        onTap: () {
          setState(() {
            switch (msg) {
              case 'A': Navigator.push(context, MaterialPageRoute(builder: (context) => A() ));
                break;
              case 'B': Navigator.push(context, MaterialPageRoute(builder: (context) => B() ));
                break;
              case 'C': Navigator.push(context, MaterialPageRoute(builder: (context) => C() ));
                break;
              case 'D': Navigator.push(context, MaterialPageRoute(builder: (context) => D() ));
                break;
            }
          });
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(child: Text(msg, style: TextStyle(fontSize: 28))),
        ),
      ),
    );
  }
}
