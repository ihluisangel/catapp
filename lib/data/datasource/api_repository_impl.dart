import 'dart:convert';
import 'dart:io';

import 'package:catapp/model/cat.dart';
import 'package:global_configuration/global_configuration.dart';
import '../../domain/datasource/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Cat>> getListCats() async {
    final String urld =
        '${GlobalConfiguration().getValue('api_domain')}/v1/breeds';

    final Uri uriPath = Uri.parse(urld);

    final response = await http.get(
      uriPath,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "x-api-key": GlobalConfiguration().getValue('api_key')
      },
    );

    List<Cat> res = [];

    if (response.statusCode == 200) {
      (json.decode(response.body) as List)
          .map((e) => res.add(Cat.fromJson(e)))
          .toList();
    } else {
      throw Exception(json.decode(response.body));
    }
    return res;
  }
}
