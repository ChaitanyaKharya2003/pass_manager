import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String title;
  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.title,
      ),
    ]);
  }
}
