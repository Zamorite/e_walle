import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:eWalle/services/theme_service.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ThemeSwitcher(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(
              child: RaisedButton(
                child: Text('Change Theme'),
                onPressed: () async {
                  var service = await ThemeService.instance;
                  // ..save('dark');
                  var theme = service.getByName('dark');
                  ThemeSwitcher.of(context).changeTheme(theme: theme);
                  service.save('dark');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
