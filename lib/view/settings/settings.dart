import 'package:dentify/controller/delete_box.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/alert_box.dart';
import 'package:dentify/view/edit_profile/edit_pofilepage.dart';
import 'package:dentify/view/profile/profile_items.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final DeleteBox deleteBox=DeleteBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ProfileItems(
            title: 'Delete account',
            icon: Icons.delete,
            iconcolor: Colors.black,
            ontap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertBox(
                    decision1: 'Delete',
                    decision2: 'Cancel',
                    title: 'Delete',
                    onPressed: () async {
                      final sharedPrefs = await SharedPreferences.getInstance();
                      await sharedPrefs.clear();
                      await deleteBox.deleteAll();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Selection()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  );
                },
              );
            },
          ),
          ProfileItems(
             title: 'Edit Profile',
            icon: Icons.edit,
            iconcolor: Colors.black,
            ontap: () async {

                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
            }
          )
        ],
      ),
    );
  }
}
