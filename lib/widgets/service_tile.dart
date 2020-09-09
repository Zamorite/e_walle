import 'package:eWalle/models/service.dart';
import 'package:eWalle/utils/constants.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final Service service;

  const ServiceTile({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6.0),
          child: Container(
            // height: 60,
            // width: 60,
            padding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 19,
            ),
            decoration: BoxDecoration(
              color: kLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(service.icon),
          ),
        ),
        Text(
          service.name,
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 10,
              ),
          // softWrap: true,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
