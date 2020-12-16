import 'package:flutter/material.dart';

class styleScreenPattern extends StatelessWidget {

  styleScreenPattern({this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}

