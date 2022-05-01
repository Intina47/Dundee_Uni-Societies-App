class Societiesdatamodel {
  String? name;
  String? imageurl;

  Societiesdatamodel({
    this.name,
    this.imageurl,
  });

  Societiesdatamodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageurl = json['imageurl'];
  }
}
