import 'ProductRes.dart';

class ServerCartModel {
  int? id;
  int? productId;
  Map? options;
  String? sku;
  Variation? variation;
  int? quantity;
  bool? isCheck;
  List<ProductModel>? product;

  ServerCartModel(
      {this.id,
        this.productId,
        this.options,
        this.sku,
        this.variation,
        this.isCheck,
        this.quantity,
        this.product});

  ServerCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isCheck = json['isCheck']??true;
    productId = json['product_Id'];
    options = json['options'];
    sku = json['sku'];
    variation = json['variation'] != null
        ? new Variation.fromJson(json['variation'])
        : null;
    quantity = json['quantity'];
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCheck'] = this.isCheck;
    data['product_Id'] = this.productId;
    data['options'] = this.options;
    data['sku'] = this.sku;
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServerCart {
  List<ServerCartModel>? data;

  ServerCart({this.data});

  ServerCart.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServerCartModel>[];
      json['data'].forEach((v) {
        data!.add(ServerCartModel.fromJson(v));
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

class CartAddedRes {
  String? message;
  int? cartId;
  ServerCartModel? data;

  CartAddedRes({this.message, this.cartId, this.data});

  CartAddedRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    cartId = json['cart_id'];
    data = json['data'] != null ? new ServerCartModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['cart_id'] = this.cartId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}