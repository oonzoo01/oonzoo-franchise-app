import 'package:flutter/foundation.dart';

class TotalTeamProvider extends ChangeNotifier {
  int totalmember = 0;

  List<Map<String, dynamic>> users = [
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Abhay Singh",
      'refercode': '#920AJDHN',
      'join': '02-01-2024',
      'active': true,
    },
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Nupur Singh",
      'refercode': '#1723AJDHN',
      'join': '07-02-2024',
      'active': false,
    },
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Sanju Singh",
      'refercode': '#5360ADHN',
      'join': '19-01-2024',
      'active': false,
    },
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Anup Pal",
      'refercode': '#628DHN',
      'join': '012-01-2024',
      'active': true,
    },
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Jaunual Pal",
      'refercode': '#1839HGHU',
      'join': '01-01-2024',
      'active': false,
    },
    {
      'image': 'assets/images/delivery.jpeg',
      'member': "Rahul Kumar",
      'refercode': '#BUI23817',
      'join': '09-02-2024',
      'active': true,
    },
  ];

  List<Map<String, dynamic>> filteredUsers = [];

  void filterUsers(String filter) {
    switch (filter) {
      case 'active':
        filteredUsers = users.where((user) => user['active'] == true).toList();
        break;
      case 'inactive':
        filteredUsers = users.where((user) => user['active'] == false).toList();
        break;
      default:
        // 'total' or any other case, show all users
        filteredUsers = List.from(users);
    }
    notifyListeners();
  }
}
