import 'dart:convert';
import 'package:flutter/services.dart' as data_root;
import 'package:flutter_application_1/datamodel.dart';

//reading the json file clubs data into our user interface homepage
Future<List<Societiesdatamodel>> readJsonData() async {
  final societyData = await data_root.rootBundle
      .loadString('societies_data/Dundee_Uni_Societies.json');
  final list = json.decode(societyData) as List<dynamic>;
  return list.map((e) => Societiesdatamodel.fromJson(e)).toList();
}
