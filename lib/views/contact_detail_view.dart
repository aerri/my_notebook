import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactDetailView extends StatelessWidget {
  final ContactViewModel contact;

  const ContactDetailView({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => contact,
      disposeViewModel: false,
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: locator<NavigationService>().back,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  minRadius: 100,
                  child: Text(
                    contact.initials,
                    style: TextStyle(fontSize: 70),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Text(
                  contact.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(thickness: 3),
              Column(
                children: contact.phones.isNotEmpty
                    ? ([
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(contact.phones[0]),
                          subtitle: Text("Phone"),
                        ),
                        Divider(thickness: 3),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(contact.phones[1]),
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
            onPressed: () => {},
            label: Text("Edit Contact"),
            icon: Icon(Icons.edit)),
      ),
    );
  }
}
