
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Appointment/mainAppointment.dart';
import 'package:dentify/view/Form/main_form.dart';
import 'package:dentify/view/Homepage/BottomNavigation.dart';
import 'package:dentify/view/Homepage/carousal.dart';
import 'package:dentify/view/Homepage/healthManager.dart';
import 'package:dentify/view/Homepage/main_home.dart';
import 'package:dentify/view/profile/profileAvatar.dart';
import 'package:flutter/material.dart';

class ControlBottom extends StatefulWidget {
  const ControlBottom({super.key});

  @override
  _ControlBottomState createState() => _ControlBottomState();
}

class _ControlBottomState extends State<ControlBottom> {
  // List of pages for navigation
  int _currentIndex = 0;  // This tracks the currently selected page

  // List of pages to display
  final List<Widget> pages = [
    Mainhome(),   // Separate screen for home content
    MainForm(),
    MainAppointment(leadIcon: false,),
    ProifleAvatar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,  
      body: pages[_currentIndex], 
      bottomNavigationBar: BottomNavigation(
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}