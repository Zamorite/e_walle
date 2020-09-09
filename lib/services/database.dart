import 'package:eWalle/models/service.dart';
import 'package:eWalle/models/user.dart';
import 'package:eWalle/utils/constants.dart';

class Database {
  static List<User> beneficiaries = [
    User(name: 'Mike', avatar: 'assets/images/png/avatars/mike.png'),
    User(name: 'Joseph', avatar: 'assets/images/png/avatars/joseph.png'),
    User(name: 'Ashley', avatar: 'assets/images/png/avatars/ashley.png'),
  ];

  static List<Service> services = [
    Service(name: 'Send Money', icon: kSend),
    Service(name: 'Receive Money', icon: kReceive),
    Service(name: 'Mobile Prepaid', icon: kPhone),
    Service(name: 'Electricity Bill', icon: kLightning),
    Service(name: 'Cashback Offer', icon: kTag),
    Service(name: 'Movie Tickets', icon: kTicket),
    Service(name: 'Flight Tickets', icon: kPlane),
    Service(name: 'More Options', icon: kOptions),
  ];
}
