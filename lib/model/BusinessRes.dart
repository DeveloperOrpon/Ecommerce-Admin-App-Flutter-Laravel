class BusinessRes {
  List<BusinessModel>? data;

  BusinessRes({this.data});

  BusinessRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BusinessModel>[];
      json['data'].forEach((v) {
        data!.add(BusinessModel.fromJson(v));
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

class BusinessModel {
  int? id;
  String? type;
  dynamic value;
  String? createdAt;
  String? updatedAt;

  BusinessModel({this.id, this.type, this.value, this.createdAt, this.updatedAt});

  BusinessModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

