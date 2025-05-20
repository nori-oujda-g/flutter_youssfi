// import 'dart:math';

// import 'package:flutter_youssfi/mvc/model/contact.model.dart';

// class ContactsRepository {
//   List<Contact> contacts = [
//     Contact(
//       id: 1,
//       name: 'abdennour',
//       type: 'Doctor',
//       profile: 'TT',
//       score: 333,
//     ),
//     Contact(id: 2, name: 'imad', type: 'Developper', profile: 'PP', score: 13),
//     Contact(id: 3, name: 'yassin', type: 'Student', profile: 'TT', score: 127),
//   ];
//   Future<List<Contact>> getContacts() async {
//     Future<List<Contact>> futur = await Future.delayed(Duration(seconds: 1));
//     int rnd = Random().nextInt(3);
//     if (rnd > 0)
//       return contacts.toList();
//     else
//       throw Exception('ERROR IN NET !');
//   }

//   Future<Iterable<Contact>> getContactsByType(String type) async {
//     Future<List<Contact>> futur = await Future.delayed(Duration(seconds: 1));
//     int rnd = Random().nextInt(10);
//     if (rnd > 3)
//       return contacts.toList().where((element) => element.type == type);
//     else
//       throw Exception('ERROR IN NET !');
//   }
// }
