import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SimpleDropdown extends StatelessWidget {
  final List<String> list;
  final ValueChanged<String> dropResult;
  final String? initialItem;
  final bool?readOnly;
  final String?hintText;
  const SimpleDropdown(
      {super.key, required this.list, required this.dropResult,this.initialItem,this.readOnly,this.hintText});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      enabled: readOnly??true,
     
      // canCloseOutsideBounds: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Select an option';
        } else {
          return null;
        }
      },
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(width:0.3),
          closedBorderRadius: BorderRadius.circular(12)),
      hintText: hintText,
      items: list,
      initialItem: initialItem,
      onChanged: (value) {
        log('changing value to: $value');
        dropResult(value!);
        
      },
    );
  }
}
