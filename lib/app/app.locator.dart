// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedGetItGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../view_models/home_view_model.dart';

final locator = StackedLocator.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => NavigationService());
}
