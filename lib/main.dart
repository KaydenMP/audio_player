import 'package:flutter/material.dart';
import 'package:songs_test/login.dart';
import 'package:songs_test/playList.dart';
import 'package:songs_test/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/second': (context) =>  appLogin(),
        '/third':(context) => const MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: const MyHomePage(),
    );
  }
}

