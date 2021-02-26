// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/contact_detail_view.dart';
import '../views/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String contactDetailView = '/contact-detail-view';
  static const all = <String>{
    homeView,
    contactDetailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.contactDetailView, page: ContactDetailView),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContactDetailView(),
        settings: data,
      );
    },
  };
}
