import 'package:my_notebook/daos/contact_dao.dart';
import 'package:my_notebook/models/phone.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqfly/sqfly.dart';

class PhoneDao extends Dao<Phone> {
  PhoneDao()
      : super(
          '''
          CREATE TABLE phones(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            number TEXT NOT NULL,
            contact_id INTEGER NOT NULL,
            FOREIGN KEY (contact_id) REFERENCES contacts(id)
          )
          ''',
          relations: [
            BelongsTo<ContactDao>(),
          ],
          converter: Converter(
            encode: (phone) => Phone.fromMap(phone),
            decode: (phone) => phone.toMap(),
          ),
        );
}
