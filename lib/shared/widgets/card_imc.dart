import 'package:flutter/material.dart';

class CardImc extends StatefulWidget {
  @override
  _CardImcState createState() => _CardImcState();
}

class _CardImcState extends State<CardImc> {
  List<Widget> children = [];

  void addChild() {
    setState(() {
      children.add(Text('Novo child'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: children,
      ),
    );
  }
}
