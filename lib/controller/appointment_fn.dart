import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppointmentDetails {
  Future<void>addAppointmentDetails(AppointmentDb value)async{
      final appointmentData=await Hive.box<AppointmentDb>('AppointmentBox');
      final _id=await appointmentData.add(value);
      value.id=_id;
  }
Future<void>deleteAppointmnet(int index)async{
final deleteData=await Hive.box<AppointmentDb>('AppointmentBox');
await deleteData.deleteAt(index);
}
  
}