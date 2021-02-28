import 'package:flutter/material.dart';
import 'package:my_notebook/app/app.locator.dart';
import 'package:my_notebook/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Notebook",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.homeView,
    );
  }
}
