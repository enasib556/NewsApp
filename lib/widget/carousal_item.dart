import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/network/api_news_service.dart';

class CarousalContainer extends StatefulWidget {
  const CarousalContainer({super.key});

  @override
  State<CarousalContainer> createState() => _CarousalContainerState();
}

class _CarousalContainerState extends State<CarousalContainer> {
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
    if (articles == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return CarouselSlider(
      items: List.generate(
        articles!.length,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: NetworkImage(articles![index].urlToImage ?? ''),
              fit: BoxFit.fill,
              opacity: 0.8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  articles![index].title ?? 'No title',
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
      ),
    );
  }
}
