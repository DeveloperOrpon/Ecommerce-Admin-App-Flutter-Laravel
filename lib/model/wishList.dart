
import 'ProductRes.dart';

class WishListRes {
  List<ProductModel>? product;

  WishListRes({this.product});

  WishListRes.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}