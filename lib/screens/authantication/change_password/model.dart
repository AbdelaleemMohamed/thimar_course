class ChangeMessage {
  ChangeMessage({
    required this.status,
    this.data,
    required this.message,
  });
  late final String status;
  late final Null data;
  late final String message;

  ChangeMessage.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
  }

}