import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: <Widget>[
        const Text(
          '25 : 00',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: const Text('Start')),
      ]),
    );
  }
}
