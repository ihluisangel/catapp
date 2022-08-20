import 'package:catapp/services/cat_service.dart';
import 'package:get/instance_manager.dart';

class MainServices {
  initServices() async {
    print('starting services ...');
    Get.lazyPut(() => CatService());
    print('All services started...');
  }
}
