import 'package:flutter_contact/contact.dart' as FlutterContact;

class Address {
  int id, contactId;
  String street, city, postCode, region, country;

  Address(this.street, this.postCode, this.region,
      {this.country, this.id, this.contactId});

  Address.fromFlutterContactAddress(FlutterContact.PostalAddress address)
      : this(address.street, address.postcode, address.region,
            country: address.country);

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        json["street"],
        json["post_code"],
        json["region"],
        country: json["coutry"],
        id: json["id"],
        contactId: json["contact_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "street": street,
        "city": city,
        "post_code": postCode,
        "region": region,
        "country": country
      };
}
