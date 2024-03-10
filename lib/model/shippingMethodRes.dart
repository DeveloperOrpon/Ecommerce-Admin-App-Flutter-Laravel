class ShippingMethodRes {
  List<ShippingMethodModel>? data;

  ShippingMethodRes({this.data});

  ShippingMethodRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShippingMethodModel>[];
      json['data'].forEach((v) {
        data!.add(new ShippingMethodModel.fromJson(v));
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

class ShippingMethodModel {
  int? id;
  String? title;
  String? description;
  num? cost;
  String? duration;
  int? status;

  ShippingMethodModel(
      {this.id,
        this.title,
        this.description,
        this.cost,
        this.duration,
        this.status});

  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    cost = json['cost'];
    duration = json['duration'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method_id'] = this.id;
    data['method_title'] = this.title;
    data['description'] = this.description;
    data['total'] = this.cost;
    data['duration'] = this.duration;
    data['status'] = this.status;
    return data;
  }
}