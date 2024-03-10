class BannerRes {
  List<BannerModel>? data;

  BannerRes({this.data});

  BannerRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannerModel>[];
      json['data'].forEach((v) {
        data!.add(new BannerModel.fromJson(v));
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

class BannerModel {
  int? id;
  String? bannerImageUrl;
  String? bannerType;
  bool? published;
  String? createdAt;
  String? updatedAt;
  String? url;

  BannerModel(
      {this.id,
        this.bannerImageUrl,
        this.bannerType,
        this.published,
        this.createdAt,
        this.updatedAt,
        this.url});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImageUrl = json['banner_image_url'];
    bannerType = json['banner_type'];
    published = json['published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner_image_url'] = this.bannerImageUrl;
    data['banner_type'] = this.bannerType;
    data['published'] = this.published;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    return data;
  }
}