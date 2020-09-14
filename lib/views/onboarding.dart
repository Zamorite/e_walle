import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:eWalle/services/theme_service.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:eWalle/view_stage.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  ThemeData newTheme = ThemeData(primaryColor: Colors.amber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(kSideBanner),
          Expanded(
            child: SafeArea(
              // color: kNavy,s
              child: Padding(
                padding: kOnboardingPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '6:20 PM',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Image.asset(kCloud),
                                ),
                                Text(
                                  '34°C',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Nov.10.2020 | Wednesday',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 13,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Image.asset(
                              Theme.of(context).brightness == Brightness.light
                                  ? kLogoV
                                  : kLogoVDark),
                        ),
                        Text(
                          'Open An Account For Digital E-Wallet Solutions.Instant Payouts.\n\nJoin For Free.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => ViewStage(),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kYellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Sign in',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Image.asset(kRightArrow),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Create an account',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(letterSpacing: 1.54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          // Flexible(
          //   child: FractionallySizedBox(
          //     widthFactor: 75,
          //     child: Container(
          //       // width: double.infinity,
          //       color: kNavy,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
