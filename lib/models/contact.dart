import 'package:my_notebook/models/address.dart';
import 'package:my_notebook/models/phone.dart';

class Contact {
  int? id;
  String? name, email;
  List<Phone>? phones;
  Address? address;

  Contact({this.id, required this.name, this.email, required this.phones, this.address});

  factory Contact.fromMap(Map<String, dynamic> map) => Contact(
        id: map['id'],
        name: map['name'],
        email: map.containsKey('email') ? map['email'] : null,
        address: map.containsKey('address') ? Address.fromMap(map['address']) : null,
        phones: map.containsKey('phones') ? (map['phones'] as List).map((phone) => Phone.fromMap(phone)).toList() : <Phone>[],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address?.toMap(),
        'phones': phones?.map((phone) => phone.toMap()).toList(),
      };
}
