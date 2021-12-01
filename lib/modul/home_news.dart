import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_project/modul/detail_news.dart';
import 'package:news_project/network/news_bloc.dart';
import 'package:news_project/network/response/headlines_response.dart';
import 'package:news_project/widget/card_news.dart';
import 'package:news_project/widget/empty.dart';
import 'package:news_project/widget/error.dart';
import 'package:news_project/widget/loading.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  void handleClick(String value) {
    switch (value) {
      case 'Close':
        exit(0);
        break;
    }
  }
  @override
  void initState() {
    super.initState();
    newsBloc.getHeadlines();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Headline News",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz, color: Colors.grey,size: 30,),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Close'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Icon(Icons.more_horiz, color: Colors.grey,size: 30,),
          // )
        ],
      ),
      body: _buildStreamMustahik(),
    );
  }

  Widget _buildStreamMustahik() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: StreamBuilder<HeadlinesResponse>(
          stream: newsBloc.listHeadlines.stream,
          builder:
              (context, AsyncSnapshot<HeadlinesResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.length > 0) {
                return Container(
                    height: 200, child: ErrorApi(error: snapshot.data!.error!));
              }
              return snapshot.data!.articles!.length > 0
                  ? _buildListMustahik(snapshot.data!)
                  : const Empty(
                url: "assets/exporting.png",
                content:
                "Belum ada mustahik yang direkomendasikan disekitarmu",
              );
            } else if (snapshot.hasError) {
              return Container(
                height: 200,
                child: Center(child: ErrorApi(error: snapshot.data!.error!)),
              );
            } else {
              return Container(
                height: 200,
                child: Center(child: LoadingWidget()),
              );
            }
          }),
    );
  }

  Widget _buildListMustahik(HeadlinesResponse response) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
            itemCount: response.articles!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNews(
                          title: response.articles![index].title!,
                          image: response.articles![index].urlToImage!,
                          date: response.articles![index].publishedAt!,
                          desc: response.articles![index].description!,
                        )),
                  );
                },
                child: CardNews(image: response.articles![index].urlToImage!,
                    title: response.articles![index].title!,
                    author: response.articles![index].author.toString()),
              );
            }));
  }
}
