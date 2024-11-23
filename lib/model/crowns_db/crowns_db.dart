import 'package:hive/hive.dart';
part 'crowns_db.g.dart';
@HiveType(typeId:3)
class CrownsDb extends HiveObject {
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String image;

  @HiveField(2)
  String category;

   @HiveField(3)
  String price;

   @HiveField(4)
  String? material;

 CrownsDb({this.id,required this.image,required this.category,required this.price,this.material,});

}