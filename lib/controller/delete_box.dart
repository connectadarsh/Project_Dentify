import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:hive/hive.dart';

class DeleteBox {
  Future<void> deleteAll() async {
    // final profileData = Hive.box<ProfileDb>('profileBox');
    // await profileData.clear();
    final signupDetails = Hive.box<UserpassDb>('userpassBox');
    await signupDetails.clear();
     final crownsData = Hive.box<CrownsDb>('CrownsBox');
    await crownsData.clear();
     final appointmentData = Hive.box<AppointmentDb>('AppointmentBox');
    await appointmentData.clear();
     final formData = Hive.box<FormDb>('FormBox');
    await formData.clear();
  }
}
