import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("Loading data from API..."),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff008E81)),
          )
        ],
      ),
    );
  }
}

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
      ),
      height: 70,
      width: 70,
      padding: EdgeInsets.all(15),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff008E81)),
      ),
    );
  }
}
