class ProductReviewRes {
  int? currentPage;
  List<ReviewModel>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  ProductReviewRes(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  ProductReviewRes.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ReviewModel>[];
      json['data'].forEach((v) {
        data!.add(new ReviewModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class ReviewModel {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  String? attachment;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;
  Product? product;
  Customer? customer;

  ReviewModel(
      {this.id,
        this.productId,
        this.customerId,
        this.comment,
        this.attachment,
        this.rating,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.product,
        this.customer});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    attachment = json['attachment'];
    rating = json['rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Product {
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
  dynamic? featured;
  dynamic? flashDeal;
  String? videoProvider;
  dynamic? videoUrl;
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
  dynamic? attachment;
  int? status;
  int? featuredStatus;
  dynamic? type;
  int? onSale;
  int? purchasable;
  int? manageStock;
  dynamic? dimensions;
  dynamic? size;
  String? regularPrice;
  String? dateOnSaleFrom;
  String? dateOnSaleTo;
  dynamic? shortDescription;
  int? catalogVisibility;
  String? createdAt;
  String? updatedAt;
  int? rating;
  int? reviewCount;
  List<Reviews>? reviews;
  List<dynamic>? translations;

  Product(
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
        this.featured,
        this.flashDeal,
        this.videoProvider,
        this.videoUrl,
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
        this.attachment,
        this.status,
        this.featuredStatus,
        this.type,
        this.onSale,
        this.purchasable,
        this.manageStock,
        this.dimensions,
        this.size,
        this.regularPrice,
        this.dateOnSaleFrom,
        this.dateOnSaleTo,
        this.shortDescription,
        this.catalogVisibility,
        this.createdAt,
        this.updatedAt,
        this.rating,
        this.reviewCount,
        this.reviews,
        this.translations});

  Product.fromJson(Map<String, dynamic> json) {
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
    featured = json['featured'];
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
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
    attachment = json['attachment'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    type = json['type'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    manageStock = json['manage_stock'];
    dimensions = json['dimensions'];
    size = json['size'];
    regularPrice = json['regular_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleTo = json['date_on_sale_to'];
    shortDescription = json['short_description'];
    catalogVisibility = json['catalog_visibility'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    data['featured'] = this.featured;
    data['flash_deal'] = this.flashDeal;
    data['video_provider'] = this.videoProvider;
    data['video_url'] = this.videoUrl;
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
    data['attachment'] = this.attachment;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;
    data['type'] = this.type;
    data['on_sale'] = this.onSale;
    data['purchasable'] = this.purchasable;
    data['manage_stock'] = this.manageStock;
    data['dimensions'] = this.dimensions;
    data['size'] = this.size;
    data['regular_price'] = this.regularPrice;
    data['date_on_sale_from'] = this.dateOnSaleFrom;
    data['date_on_sale_to'] = this.dateOnSaleTo;
    data['short_description'] = this.shortDescription;
    data['catalog_visibility'] = this.catalogVisibility;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['reviewCount'] = this.reviewCount;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  String? attachment;
  int? rating;
  int? status;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
        this.productId,
        this.customerId,
        this.comment,
        this.attachment,
        this.rating,
        this.status,
        this.createdAt,
        this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    attachment = json['attachment'];
    rating = json['rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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

class Customer {
  int? id;
  String? name;
  dynamic? fName;
  dynamic? lName;
  String? phone;
  String? image;
  String? email;
  dynamic? emailVerifiedAt;
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

  Customer(
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

  Customer.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}