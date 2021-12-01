import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_project/modul/home_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'News Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  startSplashScreen() async {
      var duration = const Duration(seconds: 2);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return HomeNews(); //pergi ke halaman main_navigation
          }),
        );
      });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("News Project", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff1D4D4E)),),
          ],
        ),
      ),
    );
  }
}
