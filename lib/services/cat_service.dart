import 'dart:convert';

import 'package:catapp/model/cat.dart';
import 'package:get/get.dart';

class CatService extends GetxService {
  CatService();

  List<Cat> onSearch({required String term, required List<Cat> list}) {
    List<Cat> result = [];
    if (term.isEmpty) {
      result.addAll(list);
    } else {
      for (var element in list) {
        if (element.name!
            .trim()
            .toLowerCase()
            .contains(term.trim().toLowerCase())) {
          result.add(element);
        }
      }
    }
    return result;
  }
}
