import 'package:get/get.dart';
import 'package:todo/bindings/task_bindings.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/upsert.dart';

List<GetPage> routes = <GetPage>[
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    binding: TaskBinding(),
  ),
  GetPage(
    name: '/upsertTask',
    page: () => UpsertScreen(),
    binding: TaskBinding(),
  ),
];
