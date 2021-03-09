import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:my_notebook/models/contact.dart';
import 'package:my_notebook/models/phone.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked_services/stacked_services.dart';

class ContactViewModel extends BaseViewModel {
  Contact _contact;

  ContactViewModel(this._contact);

  String get name => _contact.name ?? " ";

  String get initials => _contact.name!.isNotEmpty ? _contact.name![0].toUpperCase() : " ";

  String get email => _contact.email ?? " ";

  List<Phone>? get phones => _contact.phones;
  bool isEditing = false;

  void onEditContactButtonTap() {
    isEditing = !isEditing;
    notifyListeners();
  }

  void onSaveContactButtonTap() => locator<NavigationService>().navigateTo(Routes.homeView);
}
