// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'actions_custom.dart';

class Left extends StatefulWidget {
  const Left({Key? key}) : super(key: key);


  @override
  State<Left> createState() => _LeftState();
}

class _LeftState extends State<Left> {
  final items = List<Map<String, dynamic>>.generate(7, (i) => {
    'id':  i,
    'value': 'Item $i'
  });

  Map<String, dynamic>? currentItem;

  @override
  void initState() {
    super.initState();
  }

  onChageDigitKey(int index) {
    setState(() {
      currentItem = items[index - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        SelectTabIntent: SelectTabAction(onChageDigitKey)
      },
      child: SizedBox(
        width: 200, height: 500,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: currentItem != null && currentItem!['id'] == items[index]['id'] ? Colors.yellow : Colors.transparent,
              padding: const EdgeInsets.all(8),
              child: Text(
                items[index]['value']
              )
            );
          },
        ),
      ),
    );
  }
}