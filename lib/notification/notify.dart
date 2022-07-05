import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  // const Notify({ Key? key }) : super(key: key);
  final String child;
  Notify({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(child),
    );
  }
}
