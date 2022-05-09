class Societiesdatamodel {
  String? name;
  String? type;
  String? link;
  String? linkHref;
  String? description;
  String? imageurl;

  Societiesdatamodel(
      {this.name,
      this.type,
      this.link,
      this.linkHref,
      this.description,
      this.imageurl});

  Societiesdatamodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    link = json['link'];
    linkHref = json['link-href'];
    description = json['description'];
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['link'] = link;
    data['link-href'] = linkHref;
    data['description'] = description;
    data['imageurl'] = imageurl;
    return data;
  }
}
