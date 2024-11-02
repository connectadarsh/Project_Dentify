import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/utilities/custom_widgets/drop.dart';
import 'package:dentify/view/Crowns/cam_icon.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectionForm extends StatefulWidget {
  const SelectionForm({super.key});

  @override
  State<SelectionForm> createState() => _SelectionFormState();
}

class _SelectionFormState extends State<SelectionForm> {
  final List<String> items = ['crowns', 'braces'];
  String? types;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell
        (onTap: () {
          Navigator.pop(context);
        },
          child:  Icon(Icons.arrow_back_ios_new,color:AppColors.secondary,)),
        centerTitle:true ,
        backgroundColor: AppColors.primary,
        title: const Text(
          'UPLOAD YOUR DESIGNS',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: DottedBorder(
                  dashPattern: const [6,6],
                  child: Container(
                    
                      height: 250,
                      width: 300,
                      child:  CamButtonIcon(),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 234, 230),
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              SimpleDropdown(
              
                hintText: 'Select Category',
                list: items,
                dropResult: (value) {
                  setState(() {
                    types = value;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Price Your Product',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextfield(
                preffixIcon: FontAwesomeIcons.indianRupeeSign,
                width: 105,
                borderRadius: 12,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Material Type',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextfield(
                borderRadius: 12,
              ),
              SizedBox(
                height: 15,
              ),
              CoustomButton(
                  borderRadius: 12,
                  height: 45,
                  width: double.infinity,
                  onTap: () {},
                  text: 'Upload Image')
            ],
          ),
        ),
      ),
    );
  }
}
