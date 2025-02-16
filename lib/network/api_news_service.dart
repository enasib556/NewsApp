import 'package:dio/dio.dart';
import 'package:news_app/model/article.dart';

class ApiNewsService
{
  final String catgoryName;
  final Dio dio= Dio();

  ApiNewsService({required this.catgoryName});
  Future<List<Article>> get() async
  {
    var response= await dio.get('https://newsapi.org/v2/top-headlines?category=$catgoryName&apiKey=515566b4e6124bd79c65c3120022f403');
    Map<String,dynamic> json =response.data;
    List<Article> articles=[];
    for( var i in json['articles'])
      {
        articles.add(Article(urlToImage: i['urlToImage']
            , title: i['title'],
            description: i['description'], url: i['url'],

         ),);
      }
    return articles;
  }
}
