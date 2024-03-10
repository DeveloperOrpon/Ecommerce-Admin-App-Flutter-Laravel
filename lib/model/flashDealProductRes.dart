class FlashDealProductRes {
  List<FlashProductModel>? data;

  FlashDealProductRes({this.data});

  FlashDealProductRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FlashProductModel>[];
      json['data'].forEach((v) {
        data!.add(new FlashProductModel.fromJson(v));
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

class FlashProductModel {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? categoryIds;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? images;
  String? thumbnail;
  String? videoProvider;
  String? colors;
  int? variantProduct;
  String? attributes;
  String? choiceOptions;
  String? variation;
  int? published;
  int? unitPrice;
  int? purchasePrice;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  int? currentStock;
  String? details;
  int? freeShipping;
  int? status;
  int? featuredStatus;
  int? onSale;
  int? purchasable;
  int? manageStock;
  String? regularPrice;
  String? dateOnSaleFrom;
  String? dateOnSaleTo;
  int? catalogVisibility;
  String? createdAt;
  String? updatedAt;
  int? rating;
  int? reviewCount;

  FlashProductModel(
      {this.id,
        this.addedBy,
        this.userId,
        this.name,
        this.slug,
        this.categoryIds,
        this.brandId,
        this.unit,
        this.minQty,
        this.refundable,
        this.images,
        this.thumbnail,
        this.videoProvider,
        this.colors,
        this.variantProduct,
        this.attributes,
        this.choiceOptions,
        this.variation,
        this.published,
        this.unitPrice,
        this.purchasePrice,
        this.tax,
        this.taxType,
        this.discount,
        this.discountType,
        this.currentStock,
        this.details,
        this.freeShipping,
        this.status,
        this.featuredStatus,
        this.onSale,
        this.purchasable,
        this.manageStock,
        this.regularPrice,
        this.dateOnSaleFrom,
        this.dateOnSaleTo,
        this.catalogVisibility,
        this.createdAt,
        this.updatedAt,
        this.rating,
        this.reviewCount});

  FlashProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    categoryIds = json['category_ids'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    images = json['images'];
    thumbnail = json['thumbnail'];
    videoProvider = json['video_provider'];
    colors = json['colors'];
    variantProduct = json['variant_product'];
    attributes = json['attributes'];
    choiceOptions = json['choice_options'];
    variation = json['variation'];
    published = json['published'];
    unitPrice = json['unit_price'];
    purchasePrice = json['purchase_price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    details = json['details'];
    freeShipping = json['free_shipping'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    manageStock = json['manage_stock'];
    regularPrice = json['regular_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleTo = json['date_on_sale_to'];
    catalogVisibility = json['catalog_visibility'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['added_by'] = this.addedBy;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category_ids'] = this.categoryIds;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['refundable'] = this.refundable;
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    data['video_provider'] = this.videoProvider;
    data['colors'] = this.colors;
    data['variant_product'] = this.variantProduct;
    data['attributes'] = this.attributes;
    data['choice_options'] = this.choiceOptions;
    data['variation'] = this.variation;
    data['published'] = this.published;
    data['unit_price'] = this.unitPrice;
    data['purchase_price'] = this.purchasePrice;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['current_stock'] = this.currentStock;
    data['details'] = this.details;
    data['free_shipping'] = this.freeShipping;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;

    data['on_sale'] = this.onSale;
    data['purchasable'] = this.purchasable;
    data['manage_stock'] = this.manageStock;
    data['regular_price'] = this.regularPrice;
    data['date_on_sale_from'] = this.dateOnSaleFrom;
    data['date_on_sale_to'] = this.dateOnSaleTo;

    data['catalog_visibility'] = this.catalogVisibility;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['reviewCount'] = this.reviewCount;
    return data;
  }
}