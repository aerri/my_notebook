import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/models/address.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

const String DB_NAME = 'contacts_database.sqlite';
const String ContactsTableName = 'contacts';
const String PhonesTableName = 'phones';
const String AddressesTableName = 'addresses';

class DatabaseService {
  Database _database;
  final _migrationService = locator<DatabaseMigrationService>();

  Future initialize() async {
    _database =
        await openDatabase(DB_NAME, version: 1, onConfigure: _onConfigure);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
      ],
      verbose: true,
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  Future<List<Contact>> getContacts() async {
    List<Map> result = await _database.query(ContactsTableName);
    return result.map((contact) => Contact.fromMap(contact)).toList();
  }

  Future<List<Address>> getAdresses() async {
    List<Map> result = await _database.query(AddressesTableName);
    return result.map((address) => Address.fromMap(address)).toList();
  }

  Future addContact(Contact contact) async {
    try {
      await _database.insert(ContactsTableName, contact.toMap());
    } catch (e) {
      print('Could not insert the contact: $e');
    }
  }
}
