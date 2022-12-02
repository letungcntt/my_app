// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/test.dart';

class CenterWidget extends StatefulWidget {
  const CenterWidget({Key? key}) : super(key: key);


  @override
  State<CenterWidget> createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  final List data = marineLifeArray;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print(123213);
    return Container(
      width: 150, height: 500,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            data[index]['photo'],
            width: 120, height: 120,
          );
        },
      ),
    );
  }
}