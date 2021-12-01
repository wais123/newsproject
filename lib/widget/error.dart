import 'package:flutter/material.dart';

class ErrorApi extends StatelessWidget {
  final String error;

  const ErrorApi({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text.rich(
              TextSpan(
                text: 'Hello', // default text style
                children: <TextSpan>[
                  TextSpan(text: '$error',),
                  TextSpan(text: ' radarzakat@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900])),
                ],
              ),
              textAlign:  TextAlign.center,
            ),
          )
          // Container(
          //     padding: EdgeInsets.symmetric(horizontal: 30),
          //     child: Row(
          //       children: [
          //         Text("$error",textAlign: TextAlign.center,),
          //         Text("radarzakat@gmail.com",textAlign: TextAlign.center,),
          //       ],
          //     ))
        ],
      ),
    );
  }
}
