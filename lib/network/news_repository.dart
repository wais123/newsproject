import 'package:news_project/network/news_provider.dart';
import 'package:news_project/network/response/headlines_response.dart';

class NewsRepository{
  NewsProvider _apiProvider = NewsProvider();

  Future<HeadlinesResponse> headlinesProses() {
    return _apiProvider.headlinesProses();
  }
}