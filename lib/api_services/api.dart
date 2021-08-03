import 'dart:convert';
import 'package:http/http.dart';
import 'package:f_8/models/article.dart';
//service of fetching data from the API
//And Mapping it as List of items
class api_services{
  //The API Link and key
  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=b83e3c21c88d4bb5816b5ec951c549be';

  Future<List<Article>> getArticle() async {
    Response res = await get(
        Uri.parse(endPointUrl), headers: <String, String>{});
    if (res.statusCode == 200) {
      print("Good");
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      print("Success Fetching");
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}