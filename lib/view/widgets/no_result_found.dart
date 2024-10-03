import 'package:flutter/material.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/no_result.png',
          width: 100,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'No Result Found',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ));
  }
}
