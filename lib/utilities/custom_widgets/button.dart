import 'package:dentify/utilities/colors/colors.dart';
import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final VoidCallback?onTap;
  final double?width;
  final double?height;
  final String text;
  final double?borderRadius;
  final Color? color;
  final Icon?icon;
   final Color? textColor;
    final Color? borderColor;

  


  const CoustomButton({
    super.key,required this.onTap,
    this.width,
    this.height,
    required this.text,
    this.borderRadius,
    this.color,
    this.textColor,
    this.icon,
    this.borderColor

    



  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width??200,
        height:height??60,
      decoration: BoxDecoration(
        color: color??AppColors.primary,
        borderRadius: BorderRadius.circular(borderRadius??50),
      border: Border.all(color: borderColor??AppColors.primary)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon!=null)const
            SizedBox(width: 10,),
            Text(text,style: TextStyle(
              color: textColor??Colors.white,
              fontSize: 18,
            ),)
          ],
        ),
      ),
      
      
      ),
    );
  }
}