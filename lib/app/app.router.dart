// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../view_models/contact_view_model.dart';
import '../views/add_edit_contact_view.dart';
import '../views/contact_detail_view.dart';
import '../views/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String contactDetailView = '/contact-detail-view';
  static const String addEditContactView = '/add-edit-contact-view';
  static const all = <String>{
    homeView,
    contactDetailView,
    addEditContactView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.contactDetailView, page: ContactDetailView),
    RouteDef(Routes.addEditContactView, page: AddEditContactView),
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
          key: args.key,
          contact: args.contact,
        ),
        settings: data,
      );
    },
    AddEditContactView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddEditContactView(),
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
  final Key key;
  final ContactViewModel contact;
  ContactDetailViewArguments({this.key, this.contact});
}
