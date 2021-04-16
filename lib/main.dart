import 'package:flutter/material.dart';
import 'package:platform_business/screens/home/home.dart';
import 'package:platform_business/screens/store/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreScreen(),
    );
  }
}
