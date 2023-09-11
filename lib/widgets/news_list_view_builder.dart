import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsServices(Dio()).getNews(),
      builder: (context, snapShot) {
        return NewsListView(
          articles: snapShot.data ?? [],
        );
      },
    );
    // isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(child: CircularProgressIndicator()))
    //     : articles.isNotEmpty? NewsListView(articles: articles,):const SliverToBoxAdapter(child:Text('oops there was an error , try later'));
  }
}
