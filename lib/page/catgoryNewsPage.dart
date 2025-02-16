import 'package:flutter/material.dart';
import 'package:news_app/network/api_news_service.dart';

import '../model/article.dart';
import '../widget/article_item.dart';

class Catgorynewspage extends StatefulWidget {
  final String catgoryName;
  const Catgorynewspage({super.key, required this.catgoryName});

  @override
  State<Catgorynewspage> createState() => _CatgorynewspageState();
}

class _CatgorynewspageState extends State<Catgorynewspage> {
  List<Article>? articles;
  getNews() async
  {
    ApiNewsService apiNewsService=ApiNewsService(catgoryName: widget.catgoryName);
    articles= await apiNewsService.get();
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading:  IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {
          Navigator.pop(context);
        },),
        title:  Center(
            child: Text(
              widget.catgoryName,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
      body: articles==null?const Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: articles!.length,
          itemBuilder: (BuildContext context, int index) =>ArticleItem(article: articles![index]),

        ),
      ),
    );
  }
}
