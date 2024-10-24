import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:flutter/material.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Container(
          height: 70,
          width: 150,
          // color: AppColors.primary,
          child: Center(
            child: Column(
              children: [
                Text('Profile',
                    style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Selection()), (Route<dynamic>route)=>false);
                  },
                  child: Icon(Icons.logout))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
