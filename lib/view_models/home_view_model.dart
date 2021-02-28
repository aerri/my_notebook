import 'package:injectable/injectable.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:my_notebook/models/address.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@singleton
class HomeViewModel extends BaseViewModel {
  List<ContactViewModel> contacts;
  NavigationService _navigationService = locator<NavigationService>();

  Future<void> init() async {
    await _createList();
    notifyListeners();
  }

  Future onAddButtonTap() async =>
      _navigationService.navigateTo(Routes.addEditContactView);

  Future onContactTap(ContactViewModel contact) async =>
      _navigationService.navigateTo(Routes.contactDetailView,
          arguments: ContactDetailViewArguments(contact: contact));

  Future<void> _createList() async {
    contacts = List<ContactViewModel>();
    var index = 0;
    while (index != 50) {
      contacts.add(
        ContactViewModel(
          Contact(
            "Teste",
            ["9999999", "888888888"],
            email: "teste@teste.com",
            address: Address("Teste", "9999", "Teste"),
          ),
        ),
      );
      index++;
    }
  }
}
