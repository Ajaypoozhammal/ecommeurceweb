class PopularProductModel {
  PopularProductModel({
      this.id, 
      this.productName, 
      this.productPrice, 
      this.quantity, 
      this.description, 
      this.category, 
      this.subCategory, 
      this.images, 
      this.popular, 
      this.recommend, 
      this.v,});

  PopularProductModel.fromJson(dynamic json) {
    id = json['_id'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    quantity = json['quantity'];
    description = json['description'];
    category = json['category'];
    subCategory = json['subCategory'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    popular = json['popular'];
    recommend = json['recommend'];
    v = json['__v'];
  }
  String? id;
  String? productName;
  int? productPrice;
  int? quantity;
  String? description;
  String? category;
  String? subCategory;
  List<String>? images;
  bool? popular;
  bool? recommend;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['productName'] = productName;
    map['productPrice'] = productPrice;
    map['quantity'] = quantity;
    map['description'] = description;
    map['category'] = category;
    map['subCategory'] = subCategory;
    map['images'] = images;
    map['popular'] = popular;
    map['recommend'] = recommend;
    map['__v'] = v;
    return map;
  }
  static List<PopularProductModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => PopularProductModel.fromJson(value)).toList();
  }
}