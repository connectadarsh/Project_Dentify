
import 'package:hive/hive.dart';

part 'username_password.g.dart';
@HiveType(typeId:0)
class UserpassDb extends HiveObject{
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  UserpassDb({this.id,required this.username,required this.password});
}