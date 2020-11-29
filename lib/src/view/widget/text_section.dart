import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _text;

  TextSection(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
      ),
      child: Text(_text),
    );
  }
}