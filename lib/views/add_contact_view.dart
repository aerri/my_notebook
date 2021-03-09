import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/add_contact_view_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked_services/stacked_services.dart';

class AddContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddContactViewModel>.reactive(
      viewModelBuilder: () => AddContactViewModel(),
      onModelReady: (viewModel) => viewModel.notifyListeners(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: locator<NavigationService>().back,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) => viewModel.name = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone"),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) => viewModel.firstPhone = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone"),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) => viewModel.secondPhone = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (String? value) => value!.contains('@') ? null : 'Invalid email format',
                onChanged: (value) => viewModel.email = value,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.canAddContact() ? () async => viewModel.addContact() : null,
          child: Text("Save"),
        ),
      ),
    );
  }
}
