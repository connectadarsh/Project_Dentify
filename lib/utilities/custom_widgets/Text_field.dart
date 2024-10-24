import 'package:dentify/utilities/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextfield extends StatelessWidget {
    final TextEditingController? controller;
  final double? width;
  final double? height;
  final IconData? preffixIcon;
  final IconData? sufixIcon;
  final String? hintText;
  final double? borderRadius;
  final String? labelText;
  final bool hasBorder;
  final bool?readOnly;
  final int?maxlines;
  final int?maxlength;
  final VoidCallback?sufonpressed;
  final String?Function(String?)?validator;
  final TextInputType?keyboardtype;
  final AutovalidateMode?autovalidateMode;
  const CustomTextfield({
      this.controller,
      this.width,
      this.height,
      this.preffixIcon,
      this.sufixIcon,
      this.hintText,
      this.borderRadius,
      this.labelText,
      this.validator,
      this.keyboardtype,
      this.autovalidateMode,
      this.hasBorder=true,
      this.sufonpressed,
      this.readOnly,
      this.maxlines,
      this.maxlength,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: width??350,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: TextFormField(
            readOnly:readOnly??false ,
            maxLines: maxlines,
            keyboardType: keyboardtype,
            controller: controller,
            maxLength: maxlength,
            validator: validator,
            decoration: InputDecoration(
                suffixIcon: sufixIcon!=null?
           IconButton(onPressed: sufonpressed, icon:Icon( sufixIcon,color: AppColors.titile,))
              :null,
              filled: true,fillColor: AppColors.secondary,
              prefixIcon: preffixIcon!=null?
              Icon(preffixIcon,color: AppColors.subTitile,) 
              :null,
              border:hasBorder?
               OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??30),
                borderSide: BorderSide(color: AppColors.subTitile),
              ):InputBorder.none,
              enabledBorder:hasBorder?
               OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??30),
                borderSide:  BorderSide(color: AppColors.subTitile)
              ):InputBorder.none,
              focusedBorder:hasBorder?
               OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius??30),
                borderSide: BorderSide(color: AppColors.primary,width: 2.0))
                :InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.subTitile),
                labelText: labelText,
            ),
          ),
        ),
      );
      
    
  }
}