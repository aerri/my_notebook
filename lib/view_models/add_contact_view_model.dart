import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/services/database_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked_services/stacked_services.dart';

class AddContactViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  String? _name, _firstPhone, _secondPhone, _email;

  bool canAddContact() {
    notifyListeners();
    return _name != null && _firstPhone != null && _name!.isNotEmpty && _firstPhone!.isNotEmpty;
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set firstPhone(String value) {
    _firstPhone = value;
    notifyListeners();
  }

  set secondPhone(String value) {
    _secondPhone = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  //TODO: Need to ajust this call so it can manage one to many relationship and insert null values
  Future addContact() async {}
}
