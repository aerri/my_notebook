// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';

import '../view_models/contact_view_model.dart';
import '../views/add_contact_view.dart';
import '../views/contact_detail_view.dart';
import '../views/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String contactDetailView = '/contact-detail-view';
  static const String addContactView = '/add-contact-view';
  static const all = <String>{
    homeView,
    contactDetailView,
    addContactView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.contactDetailView, page: ContactDetailView),
    RouteDef(Routes.addContactView, page: AddContactView),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ContactDetailView: (data) {
      var args = data.getArgs<ContactDetailViewArguments>(
        orElse: () => ContactDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContactDetailView(
          key: args.key!,
          contactViewModel: args.contact!,
        ),
        settings: data,
      );
    },
    AddContactView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddContactView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ContactDetailView arguments holder class
class ContactDetailViewArguments {
  final Key? key;
  final ContactViewModel? contact;

  ContactDetailViewArguments({this.key, this.contact});
}
