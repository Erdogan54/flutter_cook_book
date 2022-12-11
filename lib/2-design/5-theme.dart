import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Theme Data",
      //themeMode: ThemeMode.dark,
      //darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green[800],
        fontFamily: "lobster",
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14, fontFamily: "Lobster"),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Text(
            'Hello World',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.pink,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Text("+"),
          ),
        ),
      ),
    );
  }
}
