import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
    final String? title;
    final String ?decision1;
    final String ?decision2;
     final VoidCallback onPressed;
  const CustomAlertBox({
    this.title,
    this.decision1,
    this.decision2,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text(title!,style: TextStyle(
        fontSize: 18
      ),),
          actions: [
TextButton(onPressed: onPressed, child:  Text(decision1!),),
TextButton(onPressed: (){  
  Navigator.of(context).pop();}, child: Text(decision2!)),
          ],
    );
  }
}