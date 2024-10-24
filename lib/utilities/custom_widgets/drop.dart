import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';



class SimpleDropdown extends StatelessWidget {
  final List<String>list;
  const SimpleDropdown({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      decoration: CustomDropdownDecoration(closedBorderRadius: BorderRadius.circular(22)),
      hintText: 'Select gender',
      items: list,
      initialItem: null,
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}