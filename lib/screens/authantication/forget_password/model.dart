class ForgetMessage {
  ForgetMessage({
    required this.status,
    this.data,
    required this.message,
    required this.isActive,
    required this.devMessage,
  });
  late final String status;
  late final Null data;
  late final String message;
  late final bool isActive;
  late final int devMessage;

  ForgetMessage.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
    isActive = json['is_active'];
    devMessage = json['dev_message'];
  }

}