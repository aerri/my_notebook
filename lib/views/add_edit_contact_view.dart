import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/add_edit_contact_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEditContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddEditContactViewModel>.reactive(
      viewModelBuilder: () => AddEditContactViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: locator<NavigationService>().back,
          ),
        ),
      ),
    );
  }
}
