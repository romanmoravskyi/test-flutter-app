import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_flutter_app/dto/base_dto.dart';

class CrudService<TEntity extends BaseDTO> {
  String _uri;
  String _route;
  Function _jsonFactory;

  CrudService(String uri, String route, Function jsonFactory) {
    _uri = uri;
    _route = route;
    _jsonFactory = jsonFactory;
  }

  Future<List<TEntity>> getAll() async {
    final response = await http.get('$_uri/$_route');

    List<TEntity> items;

    if (response.statusCode == 200) {
      var jsonItemsList = json.decode(response.body) as List;
      items = jsonItemsList.map((u) => _jsonFactory(u) as TEntity).toList();
    } else {
      throw HttpException("Failed to load items from $_uri/$_route!");
    }

    return items;
  }
}
