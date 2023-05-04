import 'package:get/get.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/upsert.dart';

var routes = [
  GetPage(name: 'home', page: () => HomeScreen()),
  GetPage(name: 'upsertTask', page: () => UpsertScreen()),
];
