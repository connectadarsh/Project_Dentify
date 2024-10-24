import 'package:hive/hive.dart';
part 'crowns_db.g.dart';
@HiveType(typeId:3)
class CrownsDb extends HiveObject {
  @HiveField(0)
 int ?id;
  @HiveField(1)
  String image;
 CrownsDb({this.id,required this.image});

}