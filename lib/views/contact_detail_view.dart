import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked_services/stacked_services.dart';

class ContactDetailView extends StatelessWidget {
  final ContactViewModel? contactViewModel;

  const ContactDetailView({Key? key, this.contactViewModel}) : super(key: key);

  //TODO: Add fields for address and phone type

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      viewModelBuilder: () => contactViewModel,
      disposeViewModel: false,
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: locator<NavigationService>().back,
          ),
        ),
        body: contactViewModel!.isEditing
            ? Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: contactViewModel!.name,
                      decoration: InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                    TextFormField(
                      initialValue: contactViewModel!.email,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    contactViewModel!.phones!.isEmpty ? Divider() : Column(children: _buildTextFormFields()),
                  ],
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        minRadius: 100,
                        child: Text(
                          contactViewModel!.initials,
                          style: TextStyle(fontSize: 70),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 50, left: 20),
                      child: Text(
                        contactViewModel!.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Divider(),
                    Column(
                      children: _buildListTiles(),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: contactViewModel!.isEditing ? contactViewModel!.onSaveContactButtonTap : contactViewModel!.onEditContactButtonTap,
          label: contactViewModel!.isEditing ? Text("Save") : Text("Edit Contact"),
          icon: Icon(Icons.edit),
        ),
      ),
    );
  }

  List<Widget> _buildTextFormFields() {
    var items = <Widget>[];
    if (contactViewModel!.phones!.isNotEmpty)
      contactViewModel!.phones!.forEach((element) {
        items.add(
          TextFormField(
            initialValue: element.number,
            decoration: InputDecoration(
              labelText: "Phone",
            ),
          ),
        );
      });
    return items;
  }

  List<Widget> _buildListTiles() {
    var items = <Widget>[];
    if (contactViewModel!.phones!.isNotEmpty) {
      contactViewModel!.phones!.forEach(
        (element) {
          items.add(ListTile(leading: Icon(Icons.phone), title: Text(element.number!), subtitle: Text("Phone")));
          items.add(Divider(thickness: 3));
        },
      );
    }
    return items;
  }
}
