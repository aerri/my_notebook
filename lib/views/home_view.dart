import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.onAddButtonTap,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: viewModel.contacts.length,
          itemBuilder: (context, index) {
            final contact = viewModel.contacts[index];
            return ListTile(
              onTap: () => viewModel.onContactTap(contact),
              contentPadding: EdgeInsets.only(left: 30),
              leading: CircleAvatar(
                child: Text(contact.initials),
              ),
              title: Text(contact.name),
            );
          },
        ),
      ),
    );
  }
}
