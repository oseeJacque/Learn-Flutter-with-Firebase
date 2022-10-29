import 'package:flutter/material.dart';
import 'package:fluttersocial/app/modules/models/Member.dart';

class ProfilPage extends StatefulWidget {
  final Member member;

  const ProfilPage({super.key, required this.member});

  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Je la page de Profil"),
      ),
    );
  }
}
