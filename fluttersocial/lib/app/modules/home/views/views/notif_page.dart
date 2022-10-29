import 'package:flutter/material.dart';
import 'package:fluttersocial/app/modules/models/Member.dart';

class NotifPage extends StatefulWidget {
  final  Member member;

  const NotifPage({super.key, required this.member});
  
  State<NotifPage> createState() => _NotifPageState();
 
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Je la page de notification"),
      ),
    );
  }
}
