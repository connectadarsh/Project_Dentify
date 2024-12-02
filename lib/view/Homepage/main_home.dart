import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Appointment/mainappointment.dart';
import 'package:dentify/view/Form/main_form.dart';
import 'package:dentify/view/Homepage/BottomNavigation.dart';
import 'package:dentify/view/Homepage/carousal.dart';
import 'package:dentify/view/Homepage/healthManager.dart';
import 'package:dentify/view/profile/profileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
      builder: (context, box, child) {
        var data = box.values.toList().cast<ProfileDb>();
        return Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            backgroundColor: AppColors.secondary,
            automaticallyImplyLeading: false,
            title: Text(
              ' Hey!!  Dr.${data.last.username!}',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.primary),
            ),
          ),
          body: SingleChildScrollView(
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Carousal(),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Organising Area',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HealthManager(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
