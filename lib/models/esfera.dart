import 'package:ani_con/constants/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Esfera {
  final String id;
  double x;
  double y;
  final Color color;
  final Curve curve;

  static final Random _random = Random();

  Esfera({
    required this.id,
    required this.x,
    required this.y,
    required this.color,
    required this.curve,
  });

  factory Esfera.random() {
    return Esfera(
      id: UniqueKey().toString(),
      x: _random.nextDouble() * 2 - 1,
      y: _random.nextDouble() * 2 - 1,
      color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
      curve: curves[_random.nextInt(curves.length)],
    );
  }

  void moveRandom() {
    x = _random.nextDouble() * 2 - 1;
    y = _random.nextDouble() * 2 - 1;
  }
}
