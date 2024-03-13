class SellerModelRes {
  List<SellerModel>? data;

  SellerModelRes({this.data});

  SellerModelRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SellerModel>[];
      json['data'].forEach((v) {
        data!.add(new SellerModel.fromJson(v));
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

class SellerModel {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? password;
  String? status;
  dynamic? rememberToken;
  String? createdAt;
  String? updatedAt;
  dynamic? bankName;
  dynamic? branch;
  dynamic? accountNo;
  dynamic? holderName;
  dynamic? authToken;
  dynamic? salesCommissionPercentage;
  List<Orders>? orders;
  List<Product>? product;

  SellerModel(
      {this.id,
        this.fName,
        this.lName,
        this.phone,
        this.image,
        this.email,
        this.password,
        this.status,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.bankName,
        this.branch,
        this.accountNo,
        this.holderName,
        this.authToken,
        this.salesCommissionPercentage,
        this.orders,
        this.product});

  SellerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankName = json['bank_name'];
    branch = json['branch'];
    accountNo = json['account_no'];
    holderName = json['holder_name'];
    authToken = json['auth_token'];
    salesCommissionPercentage = json['sales_commission_percentage'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bank_name'] = this.bankName;
    data['branch'] = this.branch;
    data['account_no'] = this.accountNo;
    data['holder_name'] = this.holderName;
    data['auth_token'] = this.authToken;
    data['sales_commission_percentage'] = this.salesCommissionPercentage;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? orderId;
  int? productId;
  int? sellerId;
  String? productDetails;
  int? qty;
  int? price;
  int? tax;
  int? discount;
  String? deliveryStatus;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  int? shippingMethodId;
  String? variant;
  String? variation;
  String? discountType;
  int? isStockDecreased;

  Orders(
      {this.id,
        this.orderId,
        this.productId,
        this.sellerId,
        this.productDetails,
        this.qty,
        this.price,
        this.tax,
        this.discount,
        this.deliveryStatus,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.shippingMethodId,
        this.variant,
        this.variation,
        this.discountType,
        this.isStockDecreased});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    sellerId = json['seller_id'];
    productDetails = json['product_details'];
    qty = json['qty'];
    price = json['price'];
    tax = json['tax'];
    discount = json['discount'];
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shippingMethodId = json['shipping_method_id'];
    variant = json['variant'];
    variation = json['variation'];
    discountType = json['discount_type'];
    isStockDecreased = json['is_stock_decreased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['seller_id'] = this.sellerId;
    data['product_details'] = this.productDetails;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['delivery_status'] = this.deliveryStatus;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shipping_method_id'] = this.shippingMethodId;
    data['variant'] = this.variant;
    data['variation'] = this.variation;
    data['discount_type'] = this.discountType;
    data['is_stock_decreased'] = this.isStockDecreased;
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
        this.reviewCount,});

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
    return data;
  }
}