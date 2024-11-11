// import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrownsDetails {
  Future<void>addCrownsDetails(CrownsDb value)async{
      final CrownsData=await Hive.box<CrownsDb>('CrownsBox');
      await CrownsData.add(value);
  }

  
}