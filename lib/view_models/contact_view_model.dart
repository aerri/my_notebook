import 'package:my_notebook/models/contact.dart';
import 'package:stacked/stacked.dart';

class ContactViewModel extends BaseViewModel {
  Contact _contact;

  ContactViewModel(this._contact);

  String get name => _contact?.name ?? " ";
  String get initials => _contact.name.isNotEmpty ? _contact.name[0] : " ";
  List<String> get phones => _contact.phones;
}
