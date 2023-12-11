import 'package:flutter/material.dart';

class NewjeansPage extends StatefulWidget {
  const NewjeansPage({super.key});

  @override
  State<NewjeansPage> createState() => _NewjeansPageState();
}

class _NewjeansPageState extends State<NewjeansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('등뼈'),
      ),
    );
  }
}
