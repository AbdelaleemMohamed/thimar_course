class SendCode {
  SendCode({
    required this.status,
    this.data,
    required this.message,
  });
  late final String status;
  late final Null data;
  late final String message;

  SendCode.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data;
    _data['message'] = message;
    return _data;
  }
}