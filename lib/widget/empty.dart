import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String url;
  final String content;
  const Empty({
    Key? key,
    required this.url,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              height: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                content,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}