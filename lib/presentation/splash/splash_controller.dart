import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/datasource/api_repository.dart';
import '../../main/main_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ApiRepositoryInterface apiRepositoryInterface =
      Get.find<ApiRepositoryInterface>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    starApp();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> starApp() async {
    await getConfig();
    await validateSession();
  }

  Future<void> validateSession() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    // AQUI PODRIA VALIDAR SESION Y DIRECCIONAR A DONDE QUIERA
    Get.offAllNamed(MainRoutes.home);
    // AQUI PODRIA VALIDAR SESION Y DIRECCIONAR A DONDE QUIERA
  }

  getConfig() async {
    //puedo traer la configuracion del app
  }
}
