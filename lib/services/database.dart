import 'package:eWalle/models/menu_link.dart';
import 'package:eWalle/models/service.dart';
import 'package:eWalle/models/user.dart';
import 'package:eWalle/utils/constants.dart';

class Database {
  static User user = User(
    name: 'Carol Black',
    address: 'Seattle, Washington',
    avatar: 'assets/images/png/avatars/carol.png',
  );

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

  static List<MenuLink> menuLinks = [
    MenuLink(name: 'Home', active: true),
    MenuLink(name: 'Profile', active: false),
    MenuLink(name: 'Accounts', active: false),
    MenuLink(name: 'Transactions', active: false),
    MenuLink(name: 'Stats', active: false),
    MenuLink(name: 'Settings', active: false),
    MenuLink(name: 'Flight Tickets', active: false),
    MenuLink(name: 'Help', active: false),
  ];
}
