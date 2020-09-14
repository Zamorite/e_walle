import 'package:eWalle/models/user.dart';
import 'package:eWalle/services/database.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:eWalle/widgets/beneficiary_tile.dart';
import 'package:eWalle/widgets/fab.dart';
import 'package:eWalle/widgets/iconed_subtitle.dart';
import 'package:eWalle/widgets/service_tile.dart';
import 'package:eWalle/widgets/theme_image.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final Function openDrawer;

  const HomeView({Key key, this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: kTLRPadding.copyWith(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Theme.of(context).brightness == Brightness.light
                        ? kLogoH
                        : kLogoHDark),
                    InkWell(
                      onTap: openDrawer,
                      child: ThemeImage(
                        source: kMenu,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: kLRPadding.copyWith(
                  top: 50,
                  bottom: 20,
                ),
                child: Text(
                  'Account Overview',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: kLRPadding,
                child: Container(
                  padding: kLRPadding.copyWith(
                    top: 25,
                    bottom: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '20,600',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            'Current balance',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Fab(
                        icon: kPlus,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: kLRPadding.copyWith(top: 40, bottom: 45),
                child: IconedSubtitle(
                  title: 'Send Money',
                  icon: kScan,
                ),
              ),
              Container(
                height: 125,
                child: Padding(
                  padding: kLPadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: IntrinsicHeight(
                          child: Fab(icon: kPlus),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Database.beneficiaries.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) =>
                              BeneficiaryTile(
                            user: Database.beneficiaries[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: kLRPadding.copyWith(top: 40, bottom: 20),
                child: IconedSubtitle(
                  title: 'Services',
                  icon: kPreference,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 35,
                ),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Database.services.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) => ServiceTile(
                    service: Database.services[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
