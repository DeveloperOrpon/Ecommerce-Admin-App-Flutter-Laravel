class BrandRes {
  List<Brand>? data;

  BrandRes({this.data});

  BrandRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Brand>[];
      json['data'].forEach((v) {
        data!.add(new Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? brandProductsCount;

  Brand(
      {this.id,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.brandProductsCount});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brandProductsCount = json['brand_products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['brand_products_count'] = this.brandProductsCount;
    return data;
  }
}