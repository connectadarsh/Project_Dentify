import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/Braces_db/braces_db.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:dentify/utilities/custom_widgets/Drop_down.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/view/Appointment/mainAppointment.dart';
import 'package:dentify/view/Complete_profile/main_complete.dart';
import 'package:dentify/view/Crowns/main_crowns.dart';
import 'package:dentify/view/Form/mainForm.dart';
import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:dentify/view/Signup/Signup.dart';
import 'package:dentify/view/profile/mainProfile.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:dentify/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserpassDbAdapter());
  Hive.registerAdapter(ProfileDbAdapter());
  Hive.registerAdapter(BracesDbAdapter());
   Hive.registerAdapter(CrownsDbAdapter());
      Hive.registerAdapter(AppointmentDbAdapter());


  Hive.openBox<UserpassDb>('userpassBox');
  Hive.openBox<ProfileDb>('profileBox');
  Hive.openBox<BracesDb>('BracesBox');
  Hive.openBox<CrownsDb>('CrownsBox');
  Hive.openBox<AppointmentDb>('AppointmentBox');

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:Splash() ,
      // home: Selection(),
      // home: Login(),
      // home:CustomTextfield(),
      // home: Signup(),
      // home: CompleteProfile(),
      home: ControlBottom(),
      // home: MainForm(),
      // home: MainAppointment(),
      // home: MainProfile(),
      // home: CustomDropdown(),
      // home: Maincrowns(),
    );
  }
}