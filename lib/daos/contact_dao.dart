import 'package:my_notebook/daos/address_dao.dart';
import 'package:my_notebook/daos/phone_dao.dart';
import 'package:my_notebook/models/contact.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqfly/sqfly.dart';

class ContactDao extends Dao<Contact> {
  ContactDao()
      : super(
          '''
      CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT
      )
      ''',
          relations: [
            HasMany<PhoneDao>(),
            HasOne<AddressDao>(),
          ],
          converter: Converter(
            encode: (contact) => Contact.fromMap(contact),
            decode: (contact) => contact.toMap(),
          ),
        );
}
