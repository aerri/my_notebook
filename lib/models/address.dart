import 'package:my_notebook/models/contact.dart';

class Address {
  int? id;
  String? street, city, postCode, country;
  Contact? contact;

  Address({this.id, this.street, this.city, this.postCode, this.country, required this.contact});

  factory Address.fromMap(Map<String, dynamic> map) => Address(
        id: map['id'],
        street: map.containsKey('street') ? map['street'] : null,
        city: map.containsKey('city') ? map['city'] : null,
        postCode: map.containsKey('post_code') ? map['post_code'] : null,
        country: map.containsKey('country') ? map['country'] : null,
        contact: Contact.fromMap(map['contact']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'street': street,
        'city': city,
        'post_code': postCode,
        'country': country,
        'contact': contact?.toMap(),
      };
}
