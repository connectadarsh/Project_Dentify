import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Appointment/mainAppointment.dart';
import 'package:dentify/view/Form/mainForm.dart';
import 'package:dentify/view/Homepage/BottomNavigation.dart';
import 'package:dentify/view/Homepage/carousal.dart';
import 'package:dentify/view/Homepage/healthManager.dart';
import 'package:dentify/view/profile/mainProfile.dart';
import 'package:flutter/material.dart';

class Mainhome extends StatelessWidget {


   const Mainhome({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  const Text('Hi! Dr.Appukuttan',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
              ),
              ),
      ),
      body:
       SingleChildScrollView(
         child: const Padding(
           padding: EdgeInsets.all(20),
           child: const Column(
           crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            
               Carousal(),
               SizedBox(height: 40,),
               Text('Health Manager',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
                ),
                SizedBox(height: 20,),
                HealthManager(),
                
             ],
           ),
         ),
       ),
    

    );
  }
}