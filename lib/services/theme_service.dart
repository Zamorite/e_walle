// import 'package:dynamic_theme/dynamic_theme.dart';
// import 'package:flutter/material.dart';

// class ThemeService {
//   void changeBrightness(BuildContext context) {
//     DynamicTheme.of(context).setBrightness(
//         Theme.of(context).brightness == Brightness.dark
//             ? Brightness.light
//             : Brightness.dark);
//   }

//   void changeColor(BuildContext context) {
//     DynamicTheme.of(context).setThemeData(
//       new ThemeData(
//           primaryColor: Theme.of(context).primaryColor == Colors.indigo
//               ? Colors.red
//               : Colors.indigo),
//     );
//   }
// }

import 'package:eWalle/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  ThemeService._();

  static SharedPreferences prefs;
  static var box;
  static ThemeService _instance;

  static Future<ThemeService> get instance async {
    if (_instance == null) {
      // prefs = await SharedPreferences.getInstance();
      box = await Hive.openBox('settings');
      _instance = ThemeService._();
    }
    return _instance;
  }

  final allThemes = <String, ThemeData>{
    'dark': darkTheme,
    'light': lightTheme,
  };

  String get previousThemeName {
    // String themeName = prefs.getString('previousThemeName');
    String themeName = box.get('previousThemeName');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'light' : 'dark';
    }
    return themeName;
  }

  String get themeName {
    // String themeName = prefs.getString('previousThemeName');
    String themeName = box.get('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return themeName;
  }

  get initial {
    // String themeName = prefs.getString('theme');
    String themeName = box.get('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return allThemes[themeName];
  }

  save(String newThemeName) {
    // var currentThemeName = prefs.getString('theme');
    var currentThemeName = box.get('theme');
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    currentThemeName = isPlatformDark ? 'dark' : 'light';
    // prefs.setString('previousThemeName', currentThemeName);
    // prefs.setString('theme', newThemeName);

    print('[ThemeService][Save][currentThemeName] >> $currentThemeName');
    print('[ThemeService][Save][newThemeName] >> $newThemeName');

    box.put('previousThemeName', currentThemeName);
    box.put('theme', newThemeName);
  }

  ThemeData getByName(String name) {
    return allThemes[name];
  }

  Map<String, dynamic> getNextTheme() {
    String theme = themeName;
    String previousTheme = previousThemeName;

    print('[ThemeService][Theme] >> $theme');
    print('[ThemeService][PreviousTheme] >> $previousTheme');
    return {
      'name': previousTheme,
      'theme': allThemes[previousTheme],
    };
  }
}
