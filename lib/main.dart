import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';

import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:dentify/utilities/custom_widgets/Drop_down.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/view/Appointment/mainappointment.dart';
import 'package:dentify/view/complete_profile/main_complete.dart';
import 'package:dentify/view/Crowns/main_crowns.dart';
import 'package:dentify/view/Crowns/selection_form.dart';
import 'package:dentify/view/Form/main_form.dart';
import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:dentify/view/Signup/Signup.dart';
import 'package:dentify/view/profile/mainProfile.dart';
import 'package:dentify/view/profile/profileAvatar.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:dentify/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserpassDbAdapter());
  Hive.registerAdapter(ProfileDbAdapter());
  Hive.registerAdapter(CrownsDbAdapter());
  Hive.registerAdapter(AppointmentDbAdapter());
  Hive.registerAdapter(FormDbAdapter());

 await Hive.openBox<UserpassDb>('userpassBox');
 await Hive.openBox<ProfileDb>('profileBox');
 await Hive.openBox<CrownsDb>('CrownsBox');
 await Hive.openBox<AppointmentDb>('AppointmentBox');
 await Hive.openBox<FormDb>('FormBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: Selection(),
      // home: Login(),
      // home:CustomTextfield(),
      // home: Signup(),
      // home: CompleteProfile(),
      // home: ControlBottom(),
      // home: MainForm(),
      // home: MainAppointment(),
      // home: MainProfile()
      // home: CustomDropdown(),
      // home: Maincrowns(),
      // home:SelectionForm()
    );
  }
}
