import 'package:flutter/material.dart';
import 'package:news_app/widget/catgory_list_view.dart';

import '../widget/article_list_view.dart';
import '../widget/carousal_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
            child: Text(
          'News App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CarousalContainer()),
            const SliverToBoxAdapter(
              child:  SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(child: CatgoryListView()),
            const SliverToBoxAdapter(child:  SizedBox(
              height: 30,
            )),
            const ArticleListView()
          ],
        ),
      ),
    );
  }
}
