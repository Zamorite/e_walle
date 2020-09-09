import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:eWalle/models/menu_link.dart';
import 'package:eWalle/services/database.dart';
import 'package:eWalle/services/theme_service.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:eWalle/widgets/menu_tile.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: ThemeSwitcher(
          builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 35,
                          right: 36,
                          bottom: 35,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(53.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(Database.user.avatar),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Database.user.name,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  Database.user.address,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 27),
                        child: Image.asset(kClose),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...Database.menuLinks
                          .map(
                            (menuLink) => MenuTile(
                              menuLink: menuLink,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 62,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Image.asset(kPower),
                            ),
                            Text('Logout'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 27,
                          right: 27,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Version 2.0.1'),
                            InkWell(
                              onTap: () async {
                                var service = await ThemeService.instance;
                                // ..save('dark');
                                var theme = service.getByName('light');
                                ThemeSwitcher.of(context)
                                    .changeTheme(theme: theme);
                                service.save('light');
                              },
                              child: Icon(
                                Icons.wb_sunny,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  // Center(
                  //   child: RaisedButton(
                  //     child: Text('Change Theme'),
                  //     onPressed: () async {
                  //       var service = await ThemeService.instance;
                  //       // ..save('dark');
                  //       var theme = service.getByName('dark');
                  //       ThemeSwitcher.of(context).changeTheme(theme: theme);
                  //       service.save('dark');
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
