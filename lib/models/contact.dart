import 'package:flutter_contact/contact.dart' as FlutterContact;
import 'package:my_notebook/models/address.dart';

class Contact {
  String name, email;
  List<String> phones;
  Address address;

  Contact(this.name, this.phones, {this.email, this.address});

  Contact.fromFlutterContact(FlutterContact.Contact contact)
      : this(contact.displayName, _fromItemToStringList(contact.phones),
            email: contact.emails.isNotEmpty ? contact.emails[0] : "",
            address: contact.postalAddresses.isNotEmpty
                ? Address.fromFlutterContactAddress(contact.postalAddresses[0])
                : null);

  static List<String> _fromItemToStringList(List<FlutterContact.Item> items) {
    var phones = List<String>();
    if (items.isNotEmpty) items.forEach((element) => phones.add(element.value));
    return phones;
  }
}
