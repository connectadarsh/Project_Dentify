import 'package:dentify/controller/form_fn.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/utilities/custom_widgets/drop.dart';
import 'package:flutter/material.dart';

class EditCaseHistory extends StatefulWidget {
  final FormDb data;
  final int index;
  EditCaseHistory({super.key, required this.data, required this.index});

  @override
  State<EditCaseHistory> createState() => _EditCaseHistoryState();
}

class _EditCaseHistoryState extends State<EditCaseHistory> {
  TextEditingController _name = TextEditingController();

  TextEditingController _age = TextEditingController();

  TextEditingController _address = TextEditingController();

  TextEditingController _medicalHistory = TextEditingController();

  TextEditingController _dentalHistory = TextEditingController();

  TextEditingController _diet = TextEditingController();

  TextEditingController _tobacco = TextEditingController();

  TextEditingController _oral = TextEditingController();

  TextEditingController _chief = TextEditingController();

  @override
  void initState() {
    _name.text = widget.data.name;
    _age.text = widget.data.age;
    _address.text = widget.data.address;
    _medicalHistory.text = widget.data.medicalHistory;
    _dentalHistory.text = widget.data.dentalHistory;
    _diet.text = widget.data.diet;
    _tobacco.text = widget.data.tobacco;
    _oral.text = widget.data.oral;
    _chief.text = widget.data.chief;
    super.initState();
  }

  final List<String> items = ['Male', 'Female', 'Others'];

  String? gender;
  bool readOnly = true;
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Personal Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              readOnly = false;
                            });
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(height: 12),
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
                          const Text(
                            '    Name',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _name,
                            hintText: 'Name',
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '    Age',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _age,
                            hintText: 'Age',
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SimpleDropdown(
                            readOnly: !readOnly,
                            initialItem: widget.data.gender,
                            list: items,
                            dropResult: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 150,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: CustomTextfield(
                                controller: _address,
                                hasBorder: false,
                                hintText: 'Address',
                                readOnly: readOnly,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Medical History & Drug Allergy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        height: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: CustomTextfield(
                          controller: _medicalHistory,
                          hasBorder: false,
                          hintText: 'Enter your findings',
                          readOnly: readOnly,
                        )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Past Dental History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        height: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: CustomTextfield(
                          controller: _dentalHistory,
                          hasBorder: false,
                          hintText: 'Enter your findings',
                          readOnly: readOnly,
                        )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Personal Habits',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
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
                          const Text(
                            '    Diet',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _diet,
                            hintText: 'Enter your finding',
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            '    Tobacco Related',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _tobacco,
                            hintText: 'Enter your finding',
                            readOnly: readOnly,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            '    Oral Hygiene',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            controller: _oral,
                            hintText: 'Enter your finding',
                            readOnly: readOnly,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Chief Findings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: CustomTextfield(
                          controller: _chief,
                          hasBorder: false,
                          hintText: 'Enter your findings',
                          readOnly: readOnly,
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  (readOnly == true)
                      ? Container()
                      : CoustomButton(
                          width: 400,
                          borderRadius: 12,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formDetails.updateFormDetails(
                                  widget.index,
                                  FormDb(
                                      name: _name.text,
                                      age: _age.text,
                                      gender: gender ?? widget.data.gender,
                                      address: _address.text,
                                      medicalHistory: _medicalHistory.text,
                                      dentalHistory: _dentalHistory.text,
                                      diet: _diet.text,
                                      tobacco: _tobacco.text,
                                      oral: _oral.text,
                                      chief: _chief.text,
                                      ));
                              const snackbar = SnackBar(
                                content: Text('Saved changes'),
                                duration: Duration(seconds: 5),
                                backgroundColor: Colors.green,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                              Navigator.pop(context);
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
