import 'package:my_notebook/daos/contact_dao.dart';
import 'package:my_notebook/models/address.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqfly/sqfly.dart';

class AddressDao extends Dao<Address> {
  AddressDao()
      : super(
          '''
          CREATE TABLE addresses(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            street TEXT,
            city TEXT,
            post_code TEXT,
            region TEXT,
            country TEXT,
            contact_id INTEGER NOT NULL,
            FOREIGN KEY (contact_id) REFERENCES contacts (id)
          )
          ''',
          relations: [
            BelongsTo<ContactDao>(),
          ],
          converter: Converter(
            encode: (address) => Address.fromMap(address),
            decode: (address) => address.toMap(),
          ),
        );
}
