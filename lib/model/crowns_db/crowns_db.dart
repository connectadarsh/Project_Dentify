import 'package:hive/hive.dart';
part 'crowns_db.g.dart';
@HiveType(typeId:3)
class CrownsDb extends HiveObject {
  @HiveField(0)
  String image;
  @HiveField(1)
  String category;

   @HiveField(2)
  String price;

   @HiveField(3)
  String? material;
 CrownsDb({required this.image,required this.category,required this.price,this.material,});

}