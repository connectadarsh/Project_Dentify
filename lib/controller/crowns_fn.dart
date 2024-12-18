// import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrownsDetails {
  Future<void> addCrownsDetails(CrownsDb value) async {
    final crownsData = await Hive.box<CrownsDb>('CrownsBox');
    final _id = await crownsData.add(value);
    value.id = _id;
  }

  Future<void> deleteCrownsDetails(int id) async {
    final crownsData = await Hive.box<CrownsDb>('CrownsBox');

    await crownsData.delete(id);
  }
}
