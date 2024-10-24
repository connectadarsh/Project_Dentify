import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignupCrud {
  Future<void>addSignupData(UserpassDb value)async{
      final signupDetails=await Hive.box<UserpassDb>('userpassBox');
      final _id=await signupDetails.add(value);
      value.id=_id;
  }

  
}