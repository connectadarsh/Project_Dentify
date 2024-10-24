import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BracesDetails {
  Future<void>addBracesDetails(BracesDb value)async{
      final BracesData=await Hive.box<BracesDb>('BracesBox');
      final _id=await BracesData.add(value);
      value.id=_id;
  }

  
}