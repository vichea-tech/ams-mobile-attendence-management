class VerifyModel {
  int? userId;
  String? timeSlot;
  String? message;

  VerifyModel({this.userId, this.timeSlot, this.message});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    timeSlot = json['time_slot'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['time_slot'] = this.timeSlot;
    data['message'] = this.message;
    return data;
  }
}
