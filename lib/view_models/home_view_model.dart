import 'package:injectable/injectable.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:my_notebook/services/database_service.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@singleton
class HomeViewModel extends BaseViewModel {
  List<ContactViewModel> contacts;
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  Future initialize() async {
    await _databaseService.initialize();
    var contactsFromDb = await _databaseService.getContacts();
    contacts = <ContactViewModel>[];
    contactsFromDb
        .forEach((element) => contacts.add(ContactViewModel(element)));
    notifyListeners();
  }

  Future onAddButtonTap() async =>
      _navigationService.navigateTo(Routes.addContactView);

  Future onContactTap(ContactViewModel contactViewModel) async =>
      _navigationService.navigateTo(Routes.contactDetailView,
          arguments: ContactDetailViewArguments(contact: contactViewModel));
}
