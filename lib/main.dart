import 'package:flutter/material.dart';
import 'package:pokemon/page/about.dart';
import 'package:pokemon/widget/appbar.dart';
import 'package:pokemon/page/detail.dart';
import 'package:pokemon/page/home.dart';
import 'package:pokemon/widget/bottombar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/detail': (context) => const Detail(),
        '/about': (context) => const About(),
      },
      home: const MyHomePage(title: 'Pokemon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(225, 116, 251, 231),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Sesuaikan dengan tinggi AppBar
        child: MyAppBar(),
      ),
      body: Pokemon(),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
