import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppointmentDetails {
  Future<void>addAppointmentDetails(AppointmentDb value)async{
      final AppointmentData=await Hive.box<AppointmentDb>('AppointmentBox');
      final _id=await AppointmentData.add(value);
      value.id=_id;
  }

  
}