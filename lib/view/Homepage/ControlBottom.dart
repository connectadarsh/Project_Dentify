import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Appointment/mainappointment.dart';
import 'package:dentify/view/Form/main_form.dart';
import 'package:dentify/view/Homepage/BottomNavigation.dart';
import 'package:dentify/view/Homepage/main_home.dart';
import 'package:dentify/view/profile/profileAvatar.dart';
import 'package:flutter/material.dart';

class ControlBottom extends StatefulWidget {
  const ControlBottom({super.key});

  @override
  _ControlBottomState createState() => _ControlBottomState();
}

class _ControlBottomState extends State<ControlBottom> {
  int _currentIndex = 0;  

  final List<Widget> pages = [
    const Mainhome(),   
    const MainForm(leadIcon: false),
    const MainAppointment(leadIcon: false,),
    const ProifleAvatar(),
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