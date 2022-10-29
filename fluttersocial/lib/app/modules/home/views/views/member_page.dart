import 'package:flutter/material.dart';
import 'package:fluttersocial/app/modules/models/Member.dart';

class MemberPage extends StatefulWidget {
  final  Member member;

  const MemberPage({super.key, required this.member});
  
  State<MemberPage> createState() => _MemberPageState();
 
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Je la page de Members"),
      ),
    );
  }
}
