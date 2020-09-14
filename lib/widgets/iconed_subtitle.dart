import 'package:eWalle/widgets/theme_image.dart';
import 'package:flutter/material.dart';

class IconedSubtitle extends StatelessWidget {
  final String title, icon;

  const IconedSubtitle({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ThemeImage(source: icon),
      ],
    );
  }
}
