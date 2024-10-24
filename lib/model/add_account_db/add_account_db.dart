import 'package:hive/hive.dart';
part 'add_account_db.g.dart';
@HiveType(typeId:1)
class ProfileDb extends HiveObject{
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String qualification;

  @HiveField(3)
  String regestration;
  
   @HiveField(4)
  String?clinicname;

   @HiveField(5)
  String?mobilenumber;

   @HiveField(6)
  String?specialization;


  ProfileDb({this.id,required this.username,required this.qualification,required this.regestration,this.clinicname,this.mobilenumber,this.specialization});
}