import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFn {
  Future<bool> isLogin({
    required String userName,
    required String passWord,
  })async{
    final signupDetails=Hive.box<UserpassDb>('userpassBox');

    for(var entry in signupDetails.values){
      if(entry.username==userName&&entry.password==passWord){
         final sharedPrefs= await SharedPreferences.getInstance();
          await sharedPrefs.setBool(saveKeyLogIn, true);
        return true;   
      }
    }
    return false;
  }
}