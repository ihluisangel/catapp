import 'package:get/instance_manager.dart';

import '../data/datasource/api_repository_impl.dart';
import '../domain/datasource/api_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // cliente
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
