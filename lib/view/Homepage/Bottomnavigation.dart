import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int)? onTap;  // Accepts a function that receives an index

  const BottomNavigation({
     this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      shadowColor: Colors.black,
      backgroundColor: AppColors.primary,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.file_copy_outlined, title: 'Form'),
        TabItem(icon: Icons.calendar_month_rounded, title: 'Appoint.'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      onTap: onTap,  // Calls the function with the selected index
    );
  }
}
