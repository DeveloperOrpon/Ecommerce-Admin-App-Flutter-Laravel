class NotificationRes {
  List<NotificationModel>? data;

  NotificationRes({this.data});

  NotificationRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationModel>[];
      json['data'].forEach((v) {
        data!.add(new NotificationModel.fromJson(v));
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

class NotificationModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? link;
  String? type;
  String? image;
  int? status;
  int? read;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
        this.userId,
        this.title,
        this.description,
        this.link,
        this.type,
        this.image,
        this.status,
        this.read,
        this.createdAt,
        this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    read = json['read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['type'] = this.type;
    data['image'] = this.image;
    data['status'] = this.status;
    data['read'] = this.read;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}