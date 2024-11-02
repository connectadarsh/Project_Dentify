import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
final String?title;
final IconData?icon;
final Color?iconcolor;
final VoidCallback?ontap;
   const ProfileItems({
    this.title,
    this.icon,
    this.iconcolor,
    this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon,color: iconcolor,),
            SizedBox(width: 10,),
            Text(title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}