import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactDetailView extends StatelessWidget {
  final ContactViewModel contactViewModel;

  const ContactDetailView({Key key, this.contactViewModel}) : super(key: key);

  //TODO: Add fields for address and phone type

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => contactViewModel,
      disposeViewModel: false,
      builder: (context, viewModel, child) =>
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: locator<NavigationService>().back,
              ),
            ),
            body: contactViewModel.isEditing
                ? Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: contactViewModel.name,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  TextFormField(
                    initialValue: contactViewModel.email,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  contactViewModel.phones.isEmpty
                      ? Divider()
                      : Column(
                    children: [
                      TextFormField(
                        initialValue: contactViewModel.phones[0],
                        decoration: InputDecoration(
                          hintText: "Phone",
                        ),
                      ),
                      TextFormField(
                        initialValue: contactViewModel.phones[1],
                        decoration: InputDecoration(
                          hintText: "Phone",
                        ),
                      ),
                    ],
                  )
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
                        viewModel.initials,
                        style: TextStyle(fontSize: 70),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 50, left: 20),
                    child: Text(
                      viewModel.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Divider(),
                  Column(
                    children: contactViewModel.phones.isNotEmpty
                        ? ([
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(contactViewModel.phones[0]),
                        subtitle: Text("Phone"),
                      ),
                      Divider(thickness: 3),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(contactViewModel.phones[1]),
                        subtitle: Text("Phone"),
                      ),
                      Divider(thickness: 3),
                    ])
                        : Container(),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: contactViewModel.isEditing
                  ? contactViewModel.onSaveContactButtonTap
                  : contactViewModel.onEditContactButtonTap,
              label:
              contactViewModel.isEditing ? Text("Save") : Text("Edit Contact"),
              icon: Icon(Icons.edit),
            ),
          ),
    );
  }
}
