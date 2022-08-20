import 'dart:async';

import 'package:catapp/model/cat.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class DetailItemController extends GetxController {
  late Cat item;

  DetailItemController();

  @override
  void onInit() {
    item = Get.arguments[0] as Cat;

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

  Future<void> starApp() async {}
}
