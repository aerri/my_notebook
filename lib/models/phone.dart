import 'package:my_notebook/models/contact.dart';

class Phone {
  int? id;
  String? number;
  Contact? contact;

  Phone({this.id, required this.number, this.contact});

  factory Phone.fromMap(Map<String, dynamic> map) => Phone(
        id: map['id'],
        number: map['number'],
        contact: Contact.fromMap(map['contact']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'contact': contact?.toMap(),
      };
}
