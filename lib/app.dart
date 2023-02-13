import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Local
  final themeNotifier = ThemeNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: ((context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nudge Me!',
            theme: themeNotifier.value ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
              appBar: AppBar(
                title: const Center(child: Text('Nudge App')),
                actions: [
                  Switch(
                    value: value,
                    onChanged: (_) => themeNotifier.toggleTheme(),
                  )
                ],
              ),
              body: Center(child: CounterPage()),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help')
                ],
              ),
            ),
          )),
    );
  }
}

class ThemeNotifier extends ValueNotifier<bool> {
  ThemeNotifier(bool value) : super(value);

  toggleTheme() {
    value = !value;
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Duration _currentDuration = Duration(minutes: 25);
  bool _isRunning = false;
  late Future _timer;

  void startTimer() {
    _isRunning = true;
    _timer = Future.delayed(_currentDuration, () {
      setState(() {
        _isRunning = false;
      });
    });
  }

  // void stopTimer() {
  //   _isRunning = false;
  //   _timer.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: <Widget>[
        Text(
          '${_currentDuration.inMinutes} : ${_currentDuration.inSeconds % 60}',
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: startTimer, child: Text(_isRunning ? 'Stop' : 'Start')),
      ]),
    );
  }
}
