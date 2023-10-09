

import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/authantication/login/model.dart';
import '../../screens/authantication/register/model.dart';

class ChacheHelper{
  static late SharedPreferences _prefs ;
 static Future <void> init ()async{
   _prefs = await SharedPreferences.getInstance();
  }

  static void saveCount(int count){
    _prefs.setInt("count", count);

  }

  static int getCount(){
    return _prefs.getInt("count") ?? 1;

  }


  static Future <bool> saveImageProfile(String url) async{
   return await _prefs.setString("image", url);

  }

  static String getImage(){
    return _prefs.getString("image") ?? " " ;

  }

  static String getPhone(){
    return _prefs.getString("phone") ?? " " ;

  }



  static Future saveLoginData(UserData user) async{
     await _prefs.setString("image", user.data.image);
     await _prefs.setString("phone", user.data.phone);
     await _prefs.setInt("phone", user.data.id);
     await _prefs.setString("email", user.data.email);
     await _prefs.setString("fullname", user.data.fullname);
     await _prefs.setString("token", user.data.token);
     if(user.data.city!=null){

       await _prefs.setString("cityName", user.data.city.name);
       await _prefs.setString("cityId", user.data.city.id);
     }
     await _prefs.setBool("isActive", user.data.isActive);
     await _prefs.setInt("unreadNotifications", user.data.unreadNotifications);
     await _prefs.setInt("userCartCount", user.data.userCartCount);

  }
  static Future saveRegisterData( DataRegister user) async{
    await _prefs.setString("message", user.message);
    await _prefs.setString("status", user.status);
    await _prefs.setInt("dev_Message", user.devMessage);
   // await _prefs.setString("data", user.data );


  }


}