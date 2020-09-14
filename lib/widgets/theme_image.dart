import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class ThemeImage extends StatelessWidget {
  final String source;
  final Color hue;

  const ThemeImage({
    Key key,
    this.source,
    this.hue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      source,
      color: Theme.of(context).brightness == Brightness.light
          ? null
          : hue ?? kGray,
    );
  }
}
