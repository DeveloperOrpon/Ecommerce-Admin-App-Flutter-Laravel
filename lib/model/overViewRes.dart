class OverViewRes {
  OverViewModel? data;

  OverViewRes({this.data});

  OverViewRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? OverViewModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OverViewModel {
  int? product;
  int? orderDelivered;
  int? orderFailed;
  int? orderReturned;
  int? orderTotal;
  int? category;
  int? brand;
  int? subCategory;

  OverViewModel(
      {this.product,
        this.orderDelivered,
        this.orderFailed,
        this.orderReturned,
        this.orderTotal,
        this.category,
        this.brand,
        this.subCategory});

  OverViewModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    orderDelivered = json['order_delivered'];
    orderFailed = json['order_failed'];
    orderReturned = json['order_returned'];
    orderTotal = json['order_total'];
    category = json['category'];
    brand = json['brand'];
    subCategory = json['subCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['order_delivered'] = this.orderDelivered;
    data['order_failed'] = this.orderFailed;
    data['order_returned'] = this.orderReturned;
    data['order_total'] = this.orderTotal;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['subCategory'] = this.subCategory;
    return data;
  }
}