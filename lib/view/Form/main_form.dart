import 'package:dentify/controller/form_fn.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/utilities/custom_widgets/drop.dart';
import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final List<String> items = ['Male', 'Female', 'Others'];

  TextEditingController _name = TextEditingController();

  TextEditingController _age = TextEditingController();

  TextEditingController _address = TextEditingController();

  TextEditingController _medicalHistory = TextEditingController();

  TextEditingController _dentalHistory = TextEditingController();

  TextEditingController _diet = TextEditingController();

  TextEditingController _tobacco = TextEditingController();

  TextEditingController _oral = TextEditingController();

  TextEditingController _chief = TextEditingController();

  String? gender;

  final _formKey = GlobalKey<FormState>();
  final FormDetails _formDetails = FormDetails();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
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
                        borderRadius: BorderRadius.circular(20)),
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
                            controller: _name,
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
                            controller: _age,
                            hintText: 'Age',
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          SimpleDropdown(
                            hintText: 'Select Gender',
                            list: items,
                            dropResult: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
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
                                controller: _address,
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
                  SizedBox(
                    height: 12,
                  ),
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
                          controller: _medicalHistory,
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
                  SizedBox(
                    height: 12,
                  ),
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
                          controller: _dentalHistory,
                          hasBorder: false,
                          hintText: 'Enter your findings',
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Personal Habits',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
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
                            controller: _diet,
                            hintText: 'Enter your finding',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '    Tobacco Related',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _tobacco,
                            hintText: 'Enter your finding',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '    Oral Hygiene',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _oral,
                            hintText: 'Enter your finding',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Chief Findings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
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
                          controller: _chief,
                          hasBorder: false,
                          hintText: 'Enter your findings',
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CoustomButton(
                    width: 400,
                    borderRadius: 12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formDetails.addFormDetails(FormDb(
                            name:_name.text,
                            age:_age.text,
                            gender:gender!,
                            address:_address.text,
                            medicalHistory:_medicalHistory.text,
                            dentalHistory:_dentalHistory.text,
                            diet:_diet.text,
                            tobacco:_tobacco.text,
                            oral:_oral.text,
                            chief:_chief.text));
                             const snackbar = SnackBar(
                          content: Text('Added to appointments'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        // _name.clear();
                        // _age.clear();
                        
                      }
                    },
                    text: 'Submit',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
