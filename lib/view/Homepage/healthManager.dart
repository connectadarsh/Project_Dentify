import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Crowns/crowns_page.dart';
import 'package:dentify/view/Crowns/main_crowns.dart';
import 'package:dentify/view/ListAppointment/listappointment.dart';
import 'package:flutter/material.dart';

class HealthManager extends StatelessWidget {
  const HealthManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(children: [
        Container(
          height: 50,
          width: 50,
          color: AppColors.primary,
          child: InkWell(child: Image.asset('asset/Appt1.png'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Listappointment()));
          },
          ),
          ),
          
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text('Appointments',textAlign:TextAlign.center,),
      )
      ],
      ),
    Column(children: [
        Container(
          height: 50,
          width: 50,
         
          child: InkWell(child: Image.asset('asset/crownImage4.png'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Maincrowns(),));
          },),
          ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text('Crowns',textAlign:TextAlign.center,),
      )
      ],
      ),
      Column(children: [
        Container(
          height: 50,
          width: 50,
          color: AppColors.primary,
          child:Image.asset('asset/caseHistory1.png'),
          ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text('Case History',textAlign:TextAlign.center,),
      )
      ],
      )
    
    ],);
  }
}