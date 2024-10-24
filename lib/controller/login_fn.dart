import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:hive/hive.dart';

class LoginFn {
  Future<bool> isLogin({
    required String userName,
    required String passWord,
  })async{
    final signupDetails=Hive.box<UserpassDb>('userpassBox');

    for(var entry in signupDetails.values){
      if(entry.username==userName&&entry.password==passWord){
        return true;
      }
    }
    return false;
  }
}