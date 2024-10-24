import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/utilities/custom_widgets/drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainForm extends StatelessWidget {
  MainForm({super.key});
  final List<String> items = ['Male', 'Female', 'Others'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Personal Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20)
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '    Name',
                          style: TextStyle(color: AppColors.secondary),
                        ),
                        CustomTextfield(
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '    Age',
                          style: TextStyle(color: AppColors.secondary),
                        ),
                        CustomTextfield(
                          hintText: 'Age',
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        SimpleDropdown(list: items),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 150,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: CustomTextfield(
                              hasBorder: false,
                              hintText: 'Address',
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Medical History & Drug Allergy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20)),
                      child: CustomTextfield(
                        hasBorder: false,
                        hintText: 'Enter your findings',
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Past Dental History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20)),
                      child: CustomTextfield(
                        hasBorder: false,
                        hintText: 'Enter your findings',
                      )
                      ),
                ),
                 SizedBox(
                  height: 12,
                ),
                Text(
                  'Personal Habits',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                      child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            '    Diet',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            hintText: 'Enter your finding',
                          ),
                          SizedBox(height: 12,),
                          Text(
                            '    Tobacco Related',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            hintText: 'Enter your finding',
                          ),
                            SizedBox(height: 12,),
                          Text(
                            '    Oral Hygiene',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            hintText: 'Enter your finding',
                          ),
                      ],),
                    ) ,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Chief Findings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 200,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20)),
                      child: CustomTextfield(
                        hasBorder: false,
                        hintText: 'Enter your findings',
                      )
                      ),
                ),
                SizedBox(height: 30,),
                CoustomButton(
                  width: 400,
                  borderRadius: 12,
                  onTap: (){}, text: 'Submit',), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
