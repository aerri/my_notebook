import 'package:flutter_contact/contact.dart' as FlutterContact;

class Address {
  String street, city, postCode, region, country;

  Address(this.street, this.postCode, this.region, {this.country});

  Address.fromFlutterContactAddress(FlutterContact.PostalAddress address)
      : this(address.street, address.postcode, address.region,
            country: address.country);
}
