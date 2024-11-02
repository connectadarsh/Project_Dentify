// import 'package:dentify/utilities/colors/colors.dart';
// import 'package:dentify/view/selection/selection.dart';
// import 'package:flutter/material.dart';

// class MainProfile extends StatelessWidget {
//   const MainProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       body: Center(
//         child: Container(
//           height: 70,
//           width: 150,
//           // color: AppColors.primary,
//           child: Center(
//             child: Column(
//               children: [
//                 Text('Profile',
//                     style: TextStyle(
//                         color: AppColors.secondary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20)),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Selection()), (Route<dynamic>route)=>false);
//                   },
//                   child: Icon(Icons.logout))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// 

import 'dart:io';

import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/profile/profile_items.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';


class ProifleAvatar extends StatefulWidget {
  const ProifleAvatar({super.key});

  @override
  State<ProifleAvatar> createState() => _ProifleAvatarState();
}

class _ProifleAvatarState extends State<ProifleAvatar> {
  // final box= Hive.openBox<ProfileDb>('profileBox');
  ProfileDb profileDb = ProfileDb();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
      builder: (context, box, child) {
        var data = box.values.toList().cast<ProfileDb>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.elliptical(60, 50))),
              // child: Center(child: CircleAvatar(radius:70,backgroundImage: FileImage(File(data.last.image!)),),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:(data.last.image == null)
                    ? const CircleAvatar(
                        radius: 55,
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ))
                    : CircleAvatar(
                        radius: 55,
                        backgroundImage: FileImage(File(data.last.image!)),
                      ),
                      
                  ),
                  const SizedBox(height: 10,),
                  Text('Dr.${data.last.username!}',style: const TextStyle(color: AppColors.secondary,fontSize: 16),)
                ],
              ),
            ),

            const ProfileItems(
              title: 'Settings',
              icon: Icons.settings,
              
            ),
              const ProfileItems(
              title: 'Privacy Policy',
              icon: Icons.document_scanner,
              
            ),
              const ProfileItems(
              title: 'Terms&Conditions',
              icon: Icons.edit,
              
            ),
               ProfileItems(
              title: 'Logout',
              icon: Icons.logout,
              iconcolor: Colors.red,
              ontap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Selection()), (Route<dynamic>route)=>false);
                  },
            ),
            const Spacer(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                          Column(children: [
                //  Icon(Icons.abc),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Image.asset('asset/tooth1.png',height: 50,width: 50,),
                 ),
                 
                Text('Dentify',
                style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('Version 1.0.0',style: TextStyle(fontSize:12,color: Colors.grey[350],fontWeight: FontWeight.bold),)
                          ],)
                           ],),
             )
          ],
        );
      },
    );
  }
}

