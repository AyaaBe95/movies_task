import 'package:flutter/material.dart';

import 'allMovies.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Movies",style: TextStyle(color: Colors.black),),
           backgroundColor: Colors.amber,
        ),
        body: Container(
            child: const AllMovies()
        ),
      ),
    );

  }
}