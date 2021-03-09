import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:my_notebook/services/database_service.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  late List<ContactViewModel>? _contacts;
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future<List<ContactViewModel>?> get contacts async {
    _contacts ??= (await _databaseService.getContacts()).map((contact) => ContactViewModel(contact)).toList();
    notifyListeners();
    return _contacts;
  }

  Future<void> initialize() async {
    await _databaseService.initialize();
    _contacts = (await _databaseService.getContacts()).map((contact) => ContactViewModel(contact)).toList();
    notifyListeners();
  }

  Future onAddButtonTap() async => _navigationService.navigateTo(Routes.addContactView);

  Future onContactTap(ContactViewModel contactViewModel) async =>
      _navigationService.navigateTo(Routes.contactDetailView, arguments: ContactDetailViewArguments(contact: contactViewModel));
}
