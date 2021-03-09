import 'package:my_notebook/daos/address_dao.dart';
import 'package:my_notebook/daos/contact_dao.dart';
import 'package:my_notebook/daos/phone_dao.dart';
import 'package:my_notebook/models/address.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:my_notebook/models/phone.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqfly/sqfly.dart';

class DatabaseService {
  late Sqfly _database;

  Future<void> initialize() async {
    _database = await Sqfly(
      version: 1,
      logger: true,
      daos: [
        ContactDao(),
        PhoneDao(),
        AddressDao(),
      ],
    ).init();
    var phones = <Phone>[Phone(number: '99999999'), Phone(number: '00000000')];
    var contact = Contact(name: 'João dos Testes', phones: phones);
    print(contact.toMap());
    await insertContact(contact);
  }

  Future<List<Contact>> getContacts() async {
    return await _database<ContactDao>().includes([PhoneDao, AddressDao]).toList();
  }

  Future<List<Address>> getAdresses() async {
    return await _database<AddressDao>().toList();
  }

  Future<List<Phone>> getPhones() async {
    return await _database<PhoneDao>().toList();
  }

  Future<void> insertContact(Contact contact) async {
    await _database<ContactDao>().create(contact);
  }
}
