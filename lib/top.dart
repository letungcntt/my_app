
import 'package:flutter/material.dart';
import 'package:my_app/actions_custom.dart';

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
  }

  onShowVisible(bool value) {
    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>> {
        ShowSearchIntent: ShowSearchAction(onShowVisible)
      },
      child: Container(
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
      ),
    );
  }
}