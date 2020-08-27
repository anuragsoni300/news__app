import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news__app/backend/model/articalmodel.dart';

class News {
  List<ArticalModel> news = [];
  String urls;

  Future<List<ArticalModel>> getNews(urls) async {
    String url = urls;
       // "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3263c704911c4f0fa29113f9f098c180";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null) {
            ArticalModel articalModel = ArticalModel(
              author: element["author"],
              content: element["content"],
              description: element["description"],
              title: element["title"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              
            );
            news.add(articalModel);
          }
        },
      );
    }
    return news;
  }
}
