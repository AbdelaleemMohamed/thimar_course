class CheckCode {
  CheckCode({
    required this.status,
    this.data,
    required this.message,
    required this.isActive,
  });
  late final String status;
  late final Null data;
  late final String message;
  late final bool isActive;

  CheckCode.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
    isActive = json['is_active'];
  }

}