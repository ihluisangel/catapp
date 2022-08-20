import 'package:catapp/model/cat.dart';

abstract class ApiRepositoryInterface {
  Future<List<Cat>> getListCats();
}
