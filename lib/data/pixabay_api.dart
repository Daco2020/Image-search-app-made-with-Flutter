import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/Photo.dart';

class PixabayApi implements PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '31754924-45f867a911fee356971928f35';

  @override
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
