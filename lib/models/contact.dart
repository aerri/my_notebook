import 'package:flutter_contact/contact.dart' as FlutterContact;
import 'package:my_notebook/models/address.dart';

class Contact {
  int id;
  String name, email;
  List<String> phones;
  Address address;

  Contact(this.name, this.phones, {this.email, this.address, this.id});

  Contact.fromFlutterContact(FlutterContact.Contact contact)
      : this(contact.displayName, _fromItemToStringList(contact.phones),
            email: contact.emails.isNotEmpty ? contact.emails[0] : "",
            address: contact.postalAddresses.isNotEmpty
                ? Address.fromFlutterContactAddress(contact.postalAddresses[0])
                : null);

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        json["name"],
        json["phones"],
        email: json["email"],
        address: json["address"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() {
    var map = {
      "id": id,
      "name": name,
      "phones": phones,
    };
    if (address != null) map["address"] = address;
    if (email != null && email.isNotEmpty) map["email"] = email;
    return map;
  }

  static List<String> _fromItemToStringList(List<FlutterContact.Item> items) {
    var phones = <String>[];
    if (items.isNotEmpty) items.forEach((element) => phones.add(element.value));
    return phones;
  }
}
