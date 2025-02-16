import 'package:flutter/material.dart';
import 'package:news_app/widget/catgory_item.dart';

import '../model/catgory.dart';

class CatgoryListView extends StatelessWidget {
   CatgoryListView({super.key});

  List<Catgory> catgories=[
    Catgory(image: 'assets/health.jpeg', name: 'Health'),
    Catgory(image: 'assets/technology.jpeg', name: 'Technology'),
    Catgory(image: 'assets/entertainment.jpeg', name: 'Entertainment'),
    Catgory(image: 'assets/sports.jpeg', name: 'Sports'),
    Catgory(image: 'assets/science.jpeg', name: 'Science'),
    Catgory(image: 'assets/buisness.jpeg', name: 'Buisness')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catgories.length,
        itemBuilder: (BuildContext context, int index) {
          return  CatgoryItem(catgory: catgories[index],);
        },
      ),
    );
  }
}
