import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flag = false;
  List<Color> vColor = [Colors.red, Colors.blue, Colors.green, Colors.amber];
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    List<List<double>> matrizLimites = [
      [
        0,
        screen.width / 2,
        screen.height / 2,
        0,
        0,
        screen.width,
        screen.height,
        0,
      ],
      [
        0,
        0,
        screen.height / 2,
        screen.width / 2,
        0,
        0,
        screen.height,
        screen.width,
      ],
      [
        screen.height / 2,
        0,
        0,
        screen.width / 2,
        screen.height,
        0,
        0,
        screen.width,
      ],
      [
        screen.height / 2,
        screen.width / 2,
        0,
        0,
        screen.height,
        screen.width,
        0,
        0,
      ],
    ];
    return Scaffold(
      body: Stack(
        children: [
          cortina(matrizLimites[0], vColor, flag, 1),
          cortina(matrizLimites[1], vColor, flag, 2),
          cortina(matrizLimites[2], vColor, flag, 3),
          cortina(matrizLimites[3], vColor, flag, 4),
          Align(
            alignment: Alignment(0, 0),
            child: AnimatedContainer(
              width: flag ? 250 : 0,
              height: flag ? 250 : 0,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              duration: Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Widget cortina(List<double> matriz, color, flag, fila) {
    return AnimatedPositioned(
      top: flag ? matriz[4] : matriz[0],
      right: flag ? matriz[5] : matriz[1],
      bottom: flag ? matriz[6] : matriz[2],
      left: flag ? matriz[7] : matriz[3],
      duration: Duration(milliseconds: 1000),
      child: GestureDetector(
        onDoubleTap: () {
          var gran = Random();
          setState(() {
            color[fila - 1] = Color.fromARGB(
              1000,
              gran.nextInt(255),
              gran.nextInt(255),
              gran.nextInt(255),
            );
          });
        },
        onPanDown: (desp) {
          print('x = ${desp.globalPosition.dx}');
          print('y = ${desp.globalPosition.dy}');
        },
        child: Container(decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, color[fila - 1]])
        ),),
      ),
    );
  }
}
