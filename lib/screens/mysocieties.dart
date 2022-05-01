import 'package:flutter/material.dart';

class Mysocietiespage extends StatelessWidget {
  const Mysocietiespage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MY SOcieties',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
