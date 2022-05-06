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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageurl'] = imageurl;
    data['description'] = description;
    return data;
  }

  //substring(int i, int length) {}
}
