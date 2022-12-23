class SignalRNotification {
  String? fromUserId;
  String? fromUserName;
  String? fromUserSurname;
  String? fromUserPhotoPath;
  String? toUserId;
  String? message;
  String? dateSent;
  bool? isRead;
  String? id;

  SignalRNotification(
      {this.fromUserId,
      this.fromUserName,
      this.fromUserSurname,
      this.fromUserPhotoPath,
      this.toUserId,
      this.message,
      this.dateSent,
      this.isRead,
      this.id});

  SignalRNotification.fromJson(Map<String, dynamic> json) {
    fromUserId = json['fromUserId'];
    fromUserName = json['fromUserName'];
    fromUserSurname = json['fromUserSurname'];
    fromUserPhotoPath = json['fromUserPhotoPath'];
    toUserId = json['toUserId'];
    message = json['message'];
    dateSent = json['dateSent'];
    isRead = json['isRead'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromUserId'] = fromUserId;
    data['fromUserName'] = fromUserName;
    data['fromUserSurname'] = fromUserSurname;
    data['fromUserPhotoPath'] = fromUserPhotoPath;
    data['toUserId'] = toUserId;
    data['message'] = message;
    data['dateSent'] = dateSent;
    data['isRead'] = isRead;
    data['id'] = id;
    return data;
  }
}
