class SupportTicketRes {
  List<SupportTicketModel>? data;

  SupportTicketRes({this.data});

  SupportTicketRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SupportTicketModel>[];
      json['data'].forEach((v) {
        data!.add(new SupportTicketModel.fromJson(v));
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

class SupportTicketModel {
  int? id;
  int? customerId;
  String? subject;
  String? type;
  String? priority;
  String? description;
  dynamic? reply;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? name;

  SupportTicketModel(
      {this.id,
        this.customerId,
        this.subject,
        this.type,
        this.priority,
        this.description,
        this.reply,
        this.status,
        this.createdAt,
        this.name,
        this.email,
        this.updatedAt});

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    subject = json['subject'];
    type = json['type'];
    priority = json['priority'];
    description = json['description'];
    reply = json['reply'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['subject'] = this.subject;
    data['type'] = this.type;
    data['priority'] = this.priority;
    data['description'] = this.description;
    data['reply'] = this.reply;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}