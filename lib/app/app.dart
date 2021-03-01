import 'package:my_notebook/view_models/home_view_model.dart';
import 'package:my_notebook/views/add_contact_view.dart';
import 'package:my_notebook/views/contact_detail_view.dart';
import 'package:my_notebook/views/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ContactDetailView),
    MaterialRoute(page: AddContactView),
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: HomeViewModel),
    LazySingleton(classType: NavigationService),

    // singletons
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
