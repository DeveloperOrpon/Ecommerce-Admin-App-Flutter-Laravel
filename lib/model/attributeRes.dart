class AttributeRes {
  List<AttributeModel>? data;

  AttributeRes({this.data});

  AttributeRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AttributeModel>[];
      json['data'].forEach((v) {
        data!.add(new AttributeModel.fromJson(v));
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

class AttributeModel {
  int? id;
  String? name;
  String? type;
  String? orderBy;
  String? slug;
  int? hasArchives;
  String? createdAt;
  String? updatedAt;

  AttributeModel(
      {this.id,
        this.name,
        this.type,
        this.orderBy,
        this.slug,
        this.hasArchives,
        this.createdAt,
        this.updatedAt});

  AttributeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    orderBy = json['order_by'];
    slug = json['slug'];
    hasArchives = json['has_archives'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['order_by'] = this.orderBy;
    data['slug'] = this.slug;
    data['has_archives'] = this.hasArchives;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}