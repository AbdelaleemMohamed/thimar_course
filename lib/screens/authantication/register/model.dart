
import '../login/model.dart';

class DataRegister {
  DataRegister({
    required this.status,
    this.data,
    required this.message,
    required this.devMessage,
  });
  late final String status;
  late final Null data;
  late final String message;
  late final int devMessage;

  DataRegister.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
    devMessage = json['dev_message'];
  }

}


class Data {

  late final String fullname;
  late final String phone;
  late final City city;

  Data.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    phone = json['phone'];
    city = City.fromJson(json['city']);
  }


}