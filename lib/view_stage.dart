import 'dart:math';

import 'package:eWalle/views/home.dart';
import 'package:eWalle/views/menu.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ViewStage extends StatefulWidget {
  @override
  _ViewStageState createState() => _ViewStageState();
}

class _ViewStageState extends State<ViewStage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MenuView(),
        Transform(
          transform: Matrix4.identity()
            //   ..translate(
            //     vector.Vector3(10, 0, 0),
            //   ),
            // // ..setEntry(3, 2, 0.003)
            ..scale(.5)
            ..rotateZ(-(pi / 4)),
          child: HomeView(),
        ),
      ],
    );
  }
}
