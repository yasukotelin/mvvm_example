import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/home/home_page.dart';
import 'package:mvvm_example/ui/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}
