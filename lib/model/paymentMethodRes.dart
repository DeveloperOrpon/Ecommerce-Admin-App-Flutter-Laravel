class PaymentMethodRes {
  List<PaymentModel>? data;

  PaymentMethodRes({this.data});

  PaymentMethodRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PaymentModel>[];
      json['data'].forEach((v) {
        data!.add(new PaymentModel.fromJson(v));
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

class PaymentModel {
  num? id;
  String? description;
  String? title;
  String? enabled;

  PaymentModel({this.id, this.description, this.title, this.enabled});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    title = json['title'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['title'] = this.title;
    data['enabled'] = this.enabled;
    return data;
  }
}