
import 'package:hive/hive.dart';

part 'appointment_db.g.dart';
@HiveType(typeId:4)
class AppointmentDb extends HiveObject{
  @HiveField(0)
  int ?id;

  @HiveField(1)
  String patientName;

  @HiveField(2)
  String mobileNumber;

  @HiveField(3)
  String city;

  @HiveField(4)
  String date;

  @HiveField(5)
  String time;

  AppointmentDb({this.id,required this.patientName,required this.mobileNumber,required this.city,required this.date,required this.time});
}