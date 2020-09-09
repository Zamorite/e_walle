import 'package:eWalle/models/menu_link.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  MenuLink menuLink;

  MenuTile({this.menuLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: menuLink.active ? kYellow : Colors.transparent,
            width: 4,
          ),
        ),
      ),
      child: Text(
        menuLink.name,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
