import 'package:flutter/material.dart';
import 'package:news_app/model/catgory.dart';

import '../page/catgoryNewsPage.dart';

class CatgoryItem extends StatelessWidget {
  final Catgory catgory;
  const CatgoryItem({super.key, required this.catgory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Catgorynewspage(catgoryName: catgory.name,),
            ),
          );
        },
        child: Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(catgory.image),
                  fit: BoxFit.fill,
                  opacity: 0.7)),
          child: Center(
              child: Text(
            catgory.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
