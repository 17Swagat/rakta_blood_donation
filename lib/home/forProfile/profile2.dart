import 'package:flutter/material.dart';

class Profile2_screen extends StatefulWidget {
  const Profile2_screen({ Key? key }) : super(key: key);

  @override
  State<Profile2_screen> createState() => _Profile2_screenState();
}

class _Profile2_screenState extends State<Profile2_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),      
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(),
      )
    );
  }
}