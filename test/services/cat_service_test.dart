import 'package:catapp/model/cat.dart';
import 'package:catapp/services/cat_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';

void main() {
  test('TEST- Searching by cat name', () async {
    var catservice = Get.put(CatService());
    // Build our app and trigger a frame.

    List<Cat> aux = [];
    for (var i = 0; i < 10; i++) {
      aux.add(Cat(name: "item$i"));
    }

    List<Cat> auxExpect = [];
    auxExpect.addAll(aux);
    // Verify that our counter starts at 0.
    expect(catservice.onSearch(term: "", list: aux), auxExpect);
    expect(catservice.onSearch(term: "item0", list: aux), [auxExpect[0]]);
    expect(catservice.onSearch(term: "item2", list: aux), [auxExpect[2]]);
  });
}
