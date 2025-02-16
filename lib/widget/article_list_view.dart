import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/network/api_news_service.dart';

import 'article_item.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({super.key});

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  List<Article>? articles;
  getNews() async {
    ApiNewsService apiNewsService = ApiNewsService(catgoryName: 'general');
    articles = await apiNewsService.get();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return articles == null
        ? const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()))
        : SliverList.builder(
            itemCount: articles!.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItem(
                article: articles![index],
              );
            },
          );
  }
}
