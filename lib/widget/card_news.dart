import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  const CardNews({
    Key? key,
    required this.title,
    required this.author,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1D4D4E),
            Color(0xff008E81),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        NetworkImage('$image')),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1D4D4E),
                    Color(0xff008E81),
                  ],
                )),
          ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.grey[200],
          //         borderRadius: const BorderRadius.only(
          //             topLeft: Radius.circular(8.0),
          //             bottomLeft: Radius.circular(8.0)),
          //       ),
          //       child: const Icon(
          //         Icons.person,
          //         size: 50,
          //         color: Color(0xff008E81),
          //       )),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //     // image: DecorationImage(
          //     //     fit: BoxFit.fill,
          //     //     image:
          //     //     NetworkImage('${response.data![index].image}')),
          //     borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(8.0),
          //         bottomLeft: Radius.circular(8.0)),
          //   ),
          // ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Author : $author",
                    style: const TextStyle(
                        fontSize: 12.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}