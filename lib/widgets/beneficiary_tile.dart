import 'package:eWalle/models/user.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class BeneficiaryTile extends StatelessWidget {
  final User user;

  const BeneficiaryTile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 27,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: kNavy.withOpacity(.2),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  user.avatar,
                ),
              ),
            ),
          ),
          Text(
            user.name,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
