class GetResturantsModel {
  int? results;
  List<Data>? data;

  GetResturantsModel({this.results, this.data});

  GetResturantsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? titleName;
  String? phone;
  String? subDomain;
  String? endDate;
  String? profileimg;
  String? mainColor;
  String? password;
  List<String>? maincategory;
  List<Subcategory>? subcategory;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? slug;

  Data(
      {this.sId,
      this.name,
      this.titleName,
      this.phone,
      this.subDomain,
      this.endDate,
      this.profileimg,
      this.mainColor,
      this.password,
      this.maincategory,
      this.subcategory,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    titleName = json['titleName'];
    phone = json['phone'];
    subDomain = json['subDomain'];
    endDate = json['endDate'];
    profileimg = json['profileimg'];
    mainColor = json['mainColor'];
    password = json['password'];
    maincategory = json['maincategory'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['titleName'] = this.titleName;
    data['phone'] = this.phone;
    data['subDomain'] = this.subDomain;
    data['endDate'] = this.endDate;
    data['profileimg'] = this.profileimg;
    data['mainColor'] = this.mainColor;
    data['password'] = this.password;
    data['maincategory'] = this.maincategory;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['slug'] = this.slug;
    return data;
  }
}

class Subcategory {
  String? maincategory;
  String? name;
  String? price;
  String? img;
  String? des;
  String? sId;

  Subcategory(
      {this.maincategory, this.name, this.price, this.img, this.des, this.sId});

  Subcategory.fromJson(Map<String, dynamic> json) {
    maincategory = json['maincategory'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    des = json['des'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maincategory'] = this.maincategory;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['des'] = this.des;
    data['_id'] = this.sId;
    return data;
  }
}
