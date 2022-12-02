import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Top extends StatefulWidget {
  const Top({Key? key}) : super(key: key);


  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    RawKeyboard.instance.addListener(handleEvent);
  }

  void handleEvent(RawKeyEvent event) {
    final bool hotKeyPressed = Platform.isMacOS ? event.isMetaPressed : event.isControlPressed;

    if(hotKeyPressed && event is RawKeyDownEvent) {
      if(event.isKeyPressed(LogicalKeyboardKey.keyF)) {
        setState(() {
          isVisible = true;
        });
      }
    } else if(event.isKeyPressed(LogicalKeyboardKey.escape) && event is RawKeyDownEvent) {
        setState(() {
          isVisible = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500, height: 100,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red,
            child: const Text('Top Widget'),
          ),
          if(isVisible) Positioned(
            top: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: const Text('show visible'),
            )
          )
        ],
      ),
    );
  }
}