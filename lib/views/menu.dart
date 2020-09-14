import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:eWalle/models/menu_link.dart';
import 'package:eWalle/services/database.dart';
import 'package:eWalle/services/theme_service.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:eWalle/widgets/menu_tile.dart';
import 'package:eWalle/widgets/theme_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  final Function closeDrawer;

  const MenuView({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
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
                              style: Theme.of(context).textTheme.subtitle2,
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
                  InkWell(
                    onTap: closeDrawer,
                    child: Padding(
                      padding: EdgeInsets.all(27),
                      child: Image.asset(kClose),
                    ),
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
                          child: ThemeImage(
                            source: kPower,
                            hue: kWhite,
                          ),
                        ),
                        Text(
                          'Logout',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      bottom: 20,
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Version 2.0.1',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 10),
                        ),
                        ThemeSwitcher(
                          builder: (BuildContext context) => InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () async {
                              var service = await ThemeService.instance;
                              var nextThemeName = service.previousThemeName;
                              ThemeSwitcher.of(context)
                                  .changeTheme(theme: service.getNextTheme());
                              service.save(nextThemeName);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Builder(
                                builder: (BuildContext context) {
                                  return Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Icon(Icons.brightness_3)
                                      : Icon(
                                          Icons.wb_sunny,
                                          color: kYellow,
                                        );
                                },
                              ),
                            ),
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
    );
  }
}
