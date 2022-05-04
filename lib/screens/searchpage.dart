import 'package:flutter/material.dart';
import 'package:flutter_application_1/datamodel.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Searchpage> {
  TextEditingController searchview = TextEditingController();
  List<Societiesdatamodel> searchresults = [];
  List<Societiesdatamodel> societydetails = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
