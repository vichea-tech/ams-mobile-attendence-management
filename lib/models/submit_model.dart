class SubmitModel {
  int? roomId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  SubmitModel(
      {this.roomId, this.userId, this.updatedAt, this.createdAt, this.id});

  SubmitModel.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
