import 'package:hive/hive.dart';
part 'braces_db.g.dart';
@HiveType(typeId:2)
class BracesDb extends HiveObject {
  @HiveField(0)
 int ?id;
  @HiveField(1)
  String image;
 BracesDb({this.id,required this.image});

}