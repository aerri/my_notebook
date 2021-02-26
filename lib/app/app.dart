import 'package:my_notebook/view_models/home_view_model.dart';
import 'package:my_notebook/views/contact_detail_view.dart';
import 'package:my_notebook/views/home_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ContactDetailView)
  ],
  dependencies: [
    // Lazy singletons

    // singletons
    Singleton(classType: HomeViewModel),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
