class BannerModelClass {
  BannerModelClass({
      this.id, 
      this.image, 
      this.v,});

  BannerModelClass.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    v = json['__v'];
  }
  String? id;
  String? image;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['__v'] = v;
    return map;
  }
  static List<BannerModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => BannerModelClass.fromJson(value)).toList();
  }
}