// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    RawKeyboard.instance.addListener(handleEvent);
  }

  void handleEvent(RawKeyEvent event) {
    final bool hotKeyPressed = Platform.isMacOS ? event.isMetaPressed : event.isControlPressed;
    List<LogicalKeyboardKey> digitKey = [
      LogicalKeyboardKey.digit1, LogicalKeyboardKey.digit2, LogicalKeyboardKey.digit3,
      LogicalKeyboardKey.digit4, LogicalKeyboardKey.digit5, LogicalKeyboardKey.digit6,
      LogicalKeyboardKey.digit7, LogicalKeyboardKey.digit8, LogicalKeyboardKey.digit9
    ];

    if(hotKeyPressed && event is RawKeyDownEvent) {
      if(digitKey.contains(event.logicalKey)) {
          try{
            int? keyDigital = int.tryParse(event.character!);
            if (keyDigital != null) {
              setState(() {
                currentItem = items[keyDigital - 1];
              });
            }
          } catch(err, _) {
            print(err);
          }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}