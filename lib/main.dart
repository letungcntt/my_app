// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/center.dart';
import 'package:my_app/left.dart';
import 'package:my_app/top.dart';
import 'actions_custom.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List data = marineLifeArray;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent> {
          SingleActivator(LogicalKeyboardKey.keyF, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const ShowSearchIntent(true),
          LogicalKeySet(LogicalKeyboardKey.escape) : const ShowSearchIntent(false),

          SingleActivator(LogicalKeyboardKey.digit1, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(1),
          SingleActivator(LogicalKeyboardKey.digit2, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(2),
          SingleActivator(LogicalKeyboardKey.digit3, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(3),
          SingleActivator(LogicalKeyboardKey.digit4, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(4),
          SingleActivator(LogicalKeyboardKey.digit5, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(5),
          SingleActivator(LogicalKeyboardKey.digit6, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(6),
          SingleActivator(LogicalKeyboardKey.digit7, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(7),
          SingleActivator(LogicalKeyboardKey.digit8, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(8),
          SingleActivator(LogicalKeyboardKey.digit9, meta: Platform.isMacOS, alt: !Platform.isMacOS) : const SelectTabIntent(9),
        },
        child: Scaffold(
          body: Column(
            children: [
              const Top(),
              Row(
                children: const [
                  Left(),
                  CenterWidget()
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}