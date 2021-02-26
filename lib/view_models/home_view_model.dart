import 'package:injectable/injectable.dart';
import 'package:my_notebook/models/address.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:stacked/stacked.dart';

@singleton
class HomeViewModel extends BaseViewModel {
  List<ContactViewModel> contacts;

  Future<void> init() async {
    await _createList();
    notifyListeners();
  }

  Future<void> _createList() async {
    contacts = List<ContactViewModel>();
    var index = 0;
    while (index != 100) {
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
