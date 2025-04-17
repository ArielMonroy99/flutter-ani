import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double x = 0, y = 1;
  Random random = Random();
  List<Widget> esferas = [];
  Color color = Colors.cyan;
  Curve curve = Curves.linear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(x, y),
            curve: curve,
            duration: Duration(milliseconds: 1500),
            onEnd: () {
              // setState(() {
              //   x = random.nextDouble() * 2 - 1;
              //   y = random.nextDouble() * 2 - 1;
              //   print('x = $x y = $y');
              // });
              setState(() {
                if (y == 1) {
                  color = Color.fromARGB(
                    255,
                    random.nextInt(255),
                    random.nextInt(255),
                    random.nextInt(255),
                  );
                  curve = Curves.linear;
                }
                y = 1;
                x = 0;
                curve = Curves.bounceOut;
              });
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // x = random.nextDouble() * 2 - 1;
            // y = random.nextDouble() * 2 - 1;
            // print('x = $x y = $y');
            x = 0;
            y = -1;
          });
        },
      ),
    );
  }
}
