import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailNews extends StatefulWidget {
  final String? title;
  final String? image;
  final String? date;
  final String? desc;
  const DetailNews({Key? key, this.title, this.image, this.date, this.desc}) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 23),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Detail News",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Text(widget.title!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Image.network(widget.image!),
            SizedBox(height: 15,),
            Text(widget.date!,style: TextStyle(fontSize: 12),),
            SizedBox(height: 15,),
            Text(widget.desc!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
