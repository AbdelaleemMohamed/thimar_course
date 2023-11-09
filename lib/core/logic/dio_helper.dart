import 'package:dio/dio.dart';

class DioHelper {
  static Dio _dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
  ));

  static Future<CustomResponse> send(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      var response = await _dio.post(endPoint, data: data);
      // success
      return CustomResponse(isSuccess: true,response: response,msg: response.data["message"]??"");
    } on DioException catch (ex) {
      print(ex.error);
      // failed
      return CustomResponse(isSuccess: false,response: ex.response,msg: ex.message??"");
    }
  }

  static Future<CustomResponse> get(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      var response = await _dio.get(endPoint,queryParameters: params);
      // success
      return CustomResponse(isSuccess: true,response: response,msg: response.data["message"]??"");
    } on DioException catch (ex) {
      print(ex.error);
      // failed
      return CustomResponse(isSuccess: false,response: ex.response,msg: ex.message??"");
    }
  }
}


class CustomResponse{
  bool isSuccess;
  Response? response;
  String msg;

  CustomResponse({required this.isSuccess,this.response,required this.msg});
}
