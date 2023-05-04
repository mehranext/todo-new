import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/routes/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
