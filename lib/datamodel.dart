import 'package:flutter/material.dart';

class Societiesdatamodel {
  String? name;
  String? imageurl;
  String? description;

  Societiesdatamodel({
    this.name,
    this.imageurl,
    this.description,
  });

  Societiesdatamodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageurl = json['imageurl'];
    description = json['description'];
  }
}
