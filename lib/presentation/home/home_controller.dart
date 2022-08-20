import 'package:catapp/main/main_routes.dart';
import 'package:catapp/model/cat.dart';
import 'package:catapp/services/cat_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/datasource/api_repository.dart';

class HomeController extends GetxController {
  ApiRepositoryInterface apiRepositoryInterface =
      Get.find<ApiRepositoryInterface>();
  final catService = Get.find<CatService>();

  //VARIABLES
  RxList<Cat> data = <Cat>[].obs;
  List<Cat> listCat = [];
  RxBool load = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getListCats();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getListCats() async {
    load(true);
    try {
      final res = await apiRepositoryInterface.getListCats();
      load(false);
      listCat = res;
      onChangeForSearch("");
    } catch (e) {
      load(false);
    }
  }

  goToDetail(Cat cat) {
    Get.toNamed(MainRoutes.detailItem, arguments: [cat]);
  }

  onChangeForSearch(String search) {
    final r = catService.onSearch(term: search, list: listCat);
    data(r);
  }
}
