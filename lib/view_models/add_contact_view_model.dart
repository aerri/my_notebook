import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:my_notebook/services/database_service.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:my_notebook/view_models/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddContactViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  String _name, _firstPhone, _secondPhone, _email;

  bool canAddContact() {
    notifyListeners();
    return _name != null &&
        _firstPhone != null &&
        _name.isNotEmpty &&
        _firstPhone.isNotEmpty;
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
  Future addContact() async {
    var phones = [_firstPhone];
    if (_secondPhone != null && _secondPhone.isNotEmpty)
      phones.add(_secondPhone);
    var contact = Contact(_name, phones);
    if (_email != null && _email.isNotEmpty) contact.email = _email;
    await _databaseService.addContact(contact);
    var homeViewModel = locator<HomeViewModel>();
    var viewModel = ContactViewModel(contact);
    homeViewModel.contacts.add(viewModel);
    await _navigationService
        .navigateTo(Routes.homeView)
        .then((value) => homeViewModel.notifyListeners());
  }
}
