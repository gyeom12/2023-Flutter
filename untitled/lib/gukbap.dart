import 'package:flutter/material.dart';

class gukbap extends StatefulWidget {
  const gukbap({super.key});

  @override
  State<gukbap> createState() => _gukbapState();
}

class gukbap extends State<gukbap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마로니에국밥'),
      ),
    );
  }
}
