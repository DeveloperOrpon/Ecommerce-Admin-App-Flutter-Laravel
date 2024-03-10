class SupportMessagesModelRes {
  List<SupportMessageModel>? data;

  SupportMessagesModelRes({this.data});

  SupportMessagesModelRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SupportMessageModel>[];
      json['data'].forEach((v) {
        data!.add(new SupportMessageModel.fromJson(v));
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

class SupportMessageModel {
  int? id;
  int? supportTicketId;
  int? adminId;
  dynamic? customerMessage;
  String? adminMessage;
  int? position;
  String? createdAt;
  String? updatedAt;

  SupportMessageModel(
      {this.id,
        this.supportTicketId,
        this.adminId,
        this.customerMessage,
        this.adminMessage,
        this.position,
        this.createdAt,
        this.updatedAt});

  SupportMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supportTicketId = json['support_ticket_id'];
    adminId = json['admin_id'];
    customerMessage = json['customer_message'];
    adminMessage = json['admin_message'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['support_ticket_id'] = this.supportTicketId;
    data['admin_id'] = this.adminId;
    data['customer_message'] = this.customerMessage;
    data['admin_message'] = this.adminMessage;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}