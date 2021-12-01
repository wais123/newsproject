import 'package:news_project/network/news_repository.dart';
import 'package:news_project/network/response/headlines_response.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc{
  final NewsRepository _repositoryData = NewsRepository();
  final BehaviorSubject<HeadlinesResponse> _getHeadlines = BehaviorSubject<HeadlinesResponse>();

  getHeadlines() async {
    HeadlinesResponse response = await _repositoryData.headlinesProses();
    _getHeadlines.sink.add(response);
  }

  dispose()async{
    await _getHeadlines.drain();
    _getHeadlines.close();
  }

  BehaviorSubject<HeadlinesResponse> get listHeadlines => _getHeadlines;
}

final newsBloc = NewsBloc();