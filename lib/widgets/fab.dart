import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final String icon;
  final Color color;
  final Function onTap;

  const Fab({
    Key key,
    this.icon,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? kYellow,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Image.asset(icon),
          ),
        ),
      ),
    );
  }
}
