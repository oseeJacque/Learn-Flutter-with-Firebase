import 'package:flutter/material.dart';
import 'package:fluttersocial/app/modules/models/Member.dart';

class HomePage extends StatefulWidget {
  final Member member;

  const HomePage({super.key, required this.member});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Je la page de Maison"),
      ),
    );
  }
}
