import 'dart:convert';
import 'package:spinnetflix/models/film.dart';
import 'package:http/http.dart' as http;

class FilmService {
  // récupérer les films

  Future getUsers() async {
    Uri url = Uri.parse(
        "https://api.reelgood.com/v3.0/content/random?sources=netflix");

    http.Response response = await http.get(url);

    Map data = jsonDecode(response.body);

    return Film.fromJSON(data);
  }
}
