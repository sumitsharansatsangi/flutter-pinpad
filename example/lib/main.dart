import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pinpad/pinpad.dart';

import 'package:flutter_pinpad/pinpadhelper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _pin = "";

  Future _getPin() async {
    var pin =
        await PinPadHelper.requestPin(context: context, pinpad: const PinPad());
    setState(() {
      _pin = pin ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PIN is :',
            ),
            Text(
              _pin,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getPin(),
        tooltip: 'Get Pin',
        child: const Icon(Icons.input),
      ),
    );
  }
}
