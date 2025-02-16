import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/widget/web_view.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (BuildContext context) {
                       return  WebViewScreen(url: article.url??'');
                     }
                 ));
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        article.urlToImage??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0P-fQ31QaRyvkMpzsfxUYI8JdsYyctpnNhOht9gksR6mvM3QD4A5ma6wVvAxLN0UtJ_g&usqp=CAU'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
           Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
           Text(
            article.description??'no description found',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
