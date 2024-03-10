import 'dart:developer';
import 'Category.dart';

class ProductRes {
  List<ProductModel>? products;

  ProductRes({this.products});

  ProductRes.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductModel.fromJson(v));
      });
    }
    if (json['data'] != null) {
      products = <ProductModel>[];
      json['data'].forEach((v) {
        products!.add(new ProductModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  num? id;
  String? addedBy;
  num? userId;
  num? currentStock;
  String? name;
  String? type;
  String? slug;
  num? brandId;
  String? unit;
  num? minQty;
  num? refundable;
  List<String>? images;
  String? thumbnail;
  bool? featured;
  String? flashDeal;
  String? videoProvider;
  String? videoUrl;
  List<ColorsModel>? colors;
  num? variantProduct;
  List<Attributes>? attributes;
  List<Variation>? variation;
  num? published;
  List<String>? size;
  String? price;
  String? salePrice;
  String? regularPrice;
  num? taxStatus;
  String? taxType;
  num? discount;
  String? discountType;
  String? stockStatus;
  String? description;
  num? shippingRequired;
  dynamic? attachment;
  String? createdAt;
  String? updatedAt;
  String? status;
  num? featuredStatus;
  List<String>? translations;
  num? onSale;
  num? purchasable;
  num? manageStock;
  dynamic? dimensions;
  num? averageRating;
  String? dateOnSaleFrom;
  String? dateOnSaleTo;
  num? ratingCount;
  List<int>? relatedIds;
  List<CategoryModel>? categories;
  List<ProductReviews>? productReviews;

  ProductModel(
      {this.id,
        this.addedBy,
        this.userId,
        this.name,
        this.type,
        this.currentStock,
        this.slug,
        this.brandId,
        this.unit,
        this.minQty,
        this.refundable,
        this.images,
        this.thumbnail,
        this.featured,
        this.flashDeal,
        this.videoProvider,
        this.videoUrl,
        this.colors,
        this.variantProduct,
        this.attributes,
        this.variation,
        this.published,
        this.size,
        this.price,
        this.salePrice,
        this.regularPrice,
        this.taxStatus,
        this.taxType,
        this.discount,
        this.discountType,
        this.stockStatus,
        this.description,
        this.shippingRequired,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.featuredStatus,
        this.translations,
        this.onSale,
        this.purchasable,
        this.manageStock,
        this.dimensions,
        this.averageRating,
        this.dateOnSaleFrom,
        this.dateOnSaleTo,
        this.ratingCount,
        this.relatedIds,
        this.categories});

  ProductModel.fromJson(Map<String, dynamic> json) {
    try{
      id = json['id'];
      addedBy = json['added_by'];
      currentStock = json['current_stock'];
      userId = json['user_id'];
      name = json['name'];
      type = json['type'];
      slug = json['slug'];
      brandId = json['brand_id'];
      unit = json['unit'];
      minQty = json['min_qty'];
      refundable = json['refundable'];
      images = json['images'].cast<String>();
      thumbnail = json['thumbnail'];
      featured = json['featured'];
      flashDeal = json['flash_deal'];
      videoProvider = json['video_provider'];
      videoUrl = json['video_url'];
      if (json['colors'] != null) {
        colors = <ColorsModel>[];
        json['colors'].forEach((v) {
          colors!.add(new ColorsModel.fromJson(v));
        });
      }
      variantProduct = json['variant_product'];
      if (json['attributes'] != null) {
        attributes = <Attributes>[];
        json['attributes'].forEach((v) {
          attributes!.add(new Attributes.fromJson(v));
        });
      }
      if (json['variation'] != null) {
        variation = <Variation>[];
        json['variation'].forEach((v) {
          variation!.add(new Variation.fromJson(v));
        });
      }
      published = json['published'];
      if (json['size'] != null) {
        size = [];
        json['size'].forEach((v) {
          size!.add((v));
        });
      }
      if (json['product_reviews'] != null) {
        productReviews = <ProductReviews>[];
        json['product_reviews'].forEach((v) {
          productReviews!.add(new ProductReviews.fromJson(v));
        });
      }
      price = json['price'];
      salePrice = json['sale_price'];
      regularPrice = json['regular_price'];
      taxStatus = json['tax_status'];
      taxType = json['tax_type'];
      discount = json['discount'];
      discountType = json['discount_type'];
      stockStatus = json['stock_status'];
      description = json['description'];
      shippingRequired = json['shipping_required'];
      attachment = json['attachment'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      status = json['status'];
      featuredStatus = json['featured_status'];
      if (json['translations'] != null) {
        translations =[];
        json['translations'].forEach((v) {
          translations!.add((v));
        });
      }
      onSale = json['on_sale'];
      purchasable = json['purchasable'];
      manageStock = json['manage_stock'];
      dimensions = json['dimensions'];
      averageRating = json['average_rating'];
      dateOnSaleFrom = json['date_on_sale_from'];
      dateOnSaleTo = json['date_on_sale_to'];
      ratingCount = json['rating_count'];
      if(json['related_ids']!=null) {
        relatedIds = json['related_ids'].cast<int>();
      }
      if (json['categories'] != null) {
        categories = <CategoryModel>[];
        json['categories'].forEach((v) {
          categories!.add(new CategoryModel.fromJson(v));
        });
      }
    }catch (e){
      log("Product model Error ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['current_stock'] = this.currentStock;
    data['added_by'] = this.addedBy;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['slug'] = this.slug;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['refundable'] = this.refundable;
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    data['featured'] = this.featured;
    data['flash_deal'] = this.flashDeal;
    data['video_provider'] = this.videoProvider;
    data['video_url'] = this.videoUrl;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    data['variant_product'] = this.variantProduct;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.variation != null) {
      data['variation'] = this.variation!.map((v) => v.toJson()).toList();
    }
    data['published'] = this.published;

    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['regular_price'] = this.regularPrice;
    data['tax_status'] = this.taxStatus;
    data['tax_type'] = this.taxType;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['stock_status'] = this.stockStatus;
    data['description'] = this.description;
    data['shipping_required'] = this.shippingRequired;
    data['attachment'] = this.attachment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;

    data['on_sale'] = this.onSale;
    data['purchasable'] = this.purchasable;
    data['manage_stock'] = this.manageStock;
    data['dimensions'] = this.dimensions;
    data['average_rating'] = this.averageRating;
    data['date_on_sale_from'] = this.dateOnSaleFrom;
    data['date_on_sale_to'] = this.dateOnSaleTo;
    data['rating_count'] = this.ratingCount;
    data['related_ids'] = this.relatedIds;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorsModel {
  String? name;
  String? code;

  ColorsModel({this.name, this.code});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Attributes {
  int? id;
  String? name;
  String? slug;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attributes(
      {this.id,
        this.name,
        this.slug,
        this.position,
        this.visible,
        this.variation,
        this.options});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    position = json['position'];
    visible = json['visible'];
    variation = json['variation'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['position'] = this.position;
    data['visible'] = this.visible;
    data['variation'] = this.variation;
    data['options'] = this.options;
    return data;
  }
}

class Variation {
  String? type;
  String? price;
  String? sku;
  String? qty;
  String? regularPrice;
  String? productId;
  String? salePrice;
  List<ChoiceOptions>? choiceOptions;

  Variation(
      {this.type,
        this.price,
        this.sku,
        this.qty,
        this.regularPrice,
        this.productId,
        this.salePrice,
        this.choiceOptions});

  Variation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'].toString();
    sku = json['sku'];
    qty = json['qty'].toString();
    regularPrice = json['regular_price'].toString();
    productId = json['product_id'].toString();
    salePrice = json['sale_price'].toString();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['qty'] = this.qty;
    data['regular_price'] = this.regularPrice;
    data['product_id'] = this.productId;
    data['sale_price'] = this.salePrice;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}
class ProductReviews {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  dynamic? attachment;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? customer_name;
  String? customer_image;

  ProductReviews(
      {this.id,
        this.productId,
        this.customerId,
        this.comment,
        this.attachment,
        this.rating,
        this.status,
        this.createdAt,
        this.customer_name,
        this.customer_image,
        this.updatedAt});

  ProductReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    attachment = json['attachment']??[];
    rating = json['rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer_image = json['customer_image'];
    customer_name = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['comment'] = this.comment;
    data['attachment'] = this.attachment;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}