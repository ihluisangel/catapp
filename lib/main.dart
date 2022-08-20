import 'dart:io';

import 'package:catapp/main/main_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'main/main_binding.dart';
import 'main/main_routes.dart';
import 'theme/theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  GlobalConfiguration().loadFromMap({
    "api_domain": "https://api.thecatapi.com",
    "api_key": "bda53789-d59e-46cd-9bc4-2936630fde39",
    "version": "1.0.0",
  });
  MainServices().initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cats App',
      theme: AppTheme.buildLightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: MainRoutes.splash,
      getPages: MainPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
