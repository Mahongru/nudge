import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeNotifier = ThemeNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: ((context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nudge App',
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
              body: Center(child: Text(value.toString())),
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
