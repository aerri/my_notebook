import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/view_models/contact_view_model.dart';
import 'package:my_notebook/view_models/home_view_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.initialize(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
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
        body: FutureBuilder<List<ContactViewModel>?>(
          future: viewModel.contacts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ListTile(
                    onTap: () => viewModel.onContactTap(item),
                    contentPadding: EdgeInsets.only(left: 30),
                    leading: CircleAvatar(
                      child: Text(item.initials),
                    ),
                    title: Text(item.name),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
