import 'dart:developer';

import 'address.dart';

class OrderRes {
  List<OrderModel>? data;
  Links? links;
  Meta? meta;

  OrderRes({this.data, this.links, this.meta});

  OrderRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderModel>[];
      json['data'].forEach((v) {
        data!.add(OrderModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class OrderModel {
  int? id;
  String? status;
  String? paymentStatus;
  String? deliveryStatus;
  String? currency;
  bool? pricesIncludeTax;
  int? discountTotal;
  num? total;
  int? customerId;
  Address? shipping;
  Address? billing;
  String? paymentMethod;
  int? totalTax;
  int? shippingTotal;
  String? paymentMethodTitle;
  String? shippingMethodTitle;
  int? subtotal;
  String? customerNote;
  String? number;
  String? currencyCode;
  String? dateCreated;
  String? dateModified;
  List<LineItems>? lineItems;
  CustomerModel? customer;

  OrderModel(
      {this.id,
      this.status,
      this.paymentStatus,
      this.deliveryStatus,
      this.currency,
      this.pricesIncludeTax,
      this.discountTotal,
      this.total,
      this.customerId,
      this.shipping,
      this.billing,
      this.paymentMethod,
      this.totalTax,
      this.shippingTotal,
      this.paymentMethodTitle,
      this.shippingMethodTitle,
      this.subtotal,
      this.customerNote,
      this.number,
      this.currencyCode,
      this.dateCreated,
      this.dateModified,
        this.customer,
      this.lineItems});

  OrderModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      status = json['status'];
      paymentStatus = json['paymentStatus'];
      deliveryStatus = json['deliveryStatus'];
      currency = json['currency'];
      pricesIncludeTax = json['prices_include_tax'];
      discountTotal = json['discount_total'];
      total = json['total'];
      customerId = json['customer_id'];
      shipping = json['shipping'] != null
          ? new Address.fromJson(json['shipping'])
          : null;
      billing = json['billing'] != null
          ? new Address.fromJson(json['billing'])
          : null;
      paymentMethod = json['payment_method'];
      totalTax = json['totalTax'];
      shippingTotal = json['shipping_total'];
      paymentMethodTitle = json['payment_method_title'];
      shippingMethodTitle = json['shipping_method_title'];
      subtotal = json['subtotal'];
      customerNote = json['customer_note'];
      number = json['number'];
      currencyCode = json['currencyCode'];
      dateCreated = json['date_created'];
      dateModified = json['date_modified'];
      if (json['line_items'] != null) {
        lineItems = <LineItems>[];
        json['line_items'].forEach((v) {
          lineItems!.add(LineItems.fromJson(v));
        });
      }
      customer = json['customer'] != null
          ? new CustomerModel.fromJson(json['customer'])
          : null;
    } catch (e) {
      log("OrderModelError: ${e}");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['paymentStatus'] = this.paymentStatus;
    data['deliveryStatus'] = this.deliveryStatus;
    data['currency'] = this.currency;
    data['prices_include_tax'] = this.pricesIncludeTax;
    data['discount_total'] = this.discountTotal;
    data['total'] = this.total;
    data['customer_id'] = this.customerId;
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    data['payment_method'] = this.paymentMethod;
    data['totalTax'] = this.totalTax;
    data['shipping_total'] = this.shippingTotal;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['shipping_method_title'] = this.shippingMethodTitle;
    data['subtotal'] = this.subtotal;
    data['customer_note'] = this.customerNote;
    data['number'] = this.number;
    data['currencyCode'] = this.currencyCode;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}
class LineItems {
  int? productId;
  String? name;
  String? delivery_status;
  int? quantity;
  int? total;
  int? totalTax;
  String? featuredImage;
  List<ProdOptions>? prodOptions;
  String? storeName;

  LineItems(
      {this.productId,
        this.name,
        this.delivery_status,
        this.quantity,
        this.total,
        this.totalTax,
        this.featuredImage,
        this.prodOptions,
        this.storeName});

  LineItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    delivery_status = json['delivery_status'];
    quantity = json['quantity'];
    total = json['total'];
    totalTax = json['total_tax'];
    featuredImage = json['featured_image'];
    if (json['prodOptions'] != null) {
      prodOptions = <ProdOptions>[];
      json['prodOptions'].forEach((v) {
        prodOptions!.add(new ProdOptions.fromJson(v));
      });
    }
    storeName = json['storeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['delivery_status'] = this.delivery_status;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['featured_image'] = this.featuredImage;
    if (this.prodOptions != null) {
      data['prodOptions'] = this.prodOptions!.map((v) => v.toJson()).toList();
    }
    data['storeName'] = this.storeName;
    return data;
  }
}

class ProdOptions {
  String? name;
  String? value;

  ProdOptions({this.name, this.value});

  ProdOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Links {
  dynamic first;
  dynamic last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
class CustomerModel {
  int? id;
  String? name;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  dynamic? streetAddress;
  dynamic? country;
  dynamic? city;
  dynamic? zip;
  dynamic? houseNo;
  dynamic? apartmentNo;
  String? fcmFirebaseToken;
  int? isActive;
  String? platform;

  CustomerModel(
      {this.id,
        this.name,
        this.fName,
        this.lName,
        this.phone,
        this.image,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.streetAddress,
        this.country,
        this.city,
        this.zip,
        this.houseNo,
        this.apartmentNo,
        this.fcmFirebaseToken,
        this.isActive,
        this.platform});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    streetAddress = json['street_address'];
    country = json['country'];
    city = json['city'];
    zip = json['zip'];
    houseNo = json['house_no'];
    apartmentNo = json['apartment_no'];
    fcmFirebaseToken = json['fcm_firebase_token'];
    isActive = json['is_active'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['street_address'] = this.streetAddress;
    data['country'] = this.country;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['house_no'] = this.houseNo;
    data['apartment_no'] = this.apartmentNo;
    data['fcm_firebase_token'] = this.fcmFirebaseToken;
    data['is_active'] = this.isActive;
    data['platform'] = this.platform;
    return data;
  }
}