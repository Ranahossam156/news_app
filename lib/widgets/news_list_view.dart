import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({
    super.key,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel> articles = [];
  @override
  void initState() async {
    super.initState();
    articles = await NewsServices(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    NewsServices(Dio()).getNews();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(articleModel: articles[index],),
          );
        },
      ),
    );
  }
}
