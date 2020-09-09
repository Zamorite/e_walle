// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:eWalle/utils/constants.dart';
// import 'package:eWalle/views/onboarding.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ThemeProvider(
//       // initTheme: initTheme,
//       child: Builder(
//         builder: (BuildContext context) => MaterialApp(
//           title: 'eWalle',
//           home: OnboardingView(),
//         ),
//       ),
//     );
//   }
// }

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:eWalle/services/theme_service.dart';
import 'package:eWalle/utils/themes.dart';
import 'package:eWalle/views/home.dart';
import 'package:eWalle/views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(theme: initTheme));
}

class MyApp extends StatelessWidget {
  MyApp({this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'eWalle',
          theme: ThemeProvider.of(context),
          home: HomeView(),
          // home: OnboardingView(),
        );
      }),
    );
  }
}
