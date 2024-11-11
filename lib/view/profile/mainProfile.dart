import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/profile/profileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: ProifleAvatar(),
    );
  }
}
