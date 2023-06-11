import 'package:flutter/material.dart';
import 'package:skill_tracker/pages/auth_page.dart';
import 'package:skill_tracker/widgets/bottom_nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Skill Tracker',
      home: BottomNavBar(),
    );
  }
}
