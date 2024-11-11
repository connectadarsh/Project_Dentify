import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDetails {
  Future<void> addProfileDetails(ProfileDb value) async {
    final profileData = await Hive.box<ProfileDb>('profileBox');
    final _id = await profileData.add(value);
    value.id = _id;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(saveKeyProfile, true);
  }
}
