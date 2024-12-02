import 'package:dentify/controller/form_fn.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/utilities/custom_widgets/drop.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainForm extends StatefulWidget {
  final bool leadIcon;
  const MainForm({super.key, required this.leadIcon});

  @override 
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final List<String> items = ['Male', 'Female', 'Others'];

  final TextEditingController _name = TextEditingController();

  final TextEditingController _age = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _medicalHistory = TextEditingController();

  final TextEditingController _dentalHistory = TextEditingController();

  final TextEditingController _diet = TextEditingController();

  final TextEditingController _tobacco = TextEditingController();

  final TextEditingController _oral = TextEditingController();

  final TextEditingController _chief = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String? gender;

  final _formKey = GlobalKey<FormState>();
  final FormDetails _formDetails = FormDetails();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Form',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            toolbarHeight: 30,
            backgroundColor: AppColors.secondary,
            leading: (widget.leadIcon)
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  )
                : Container(),
          ),
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
                  const Text(
                    'Personal Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '    Age',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            keyboardtype: TextInputType.number,
                            controller: _age,
                            hintText: 'Age',
                          ),
                          const SizedBox(
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
                          const SizedBox(
                            height: 14,
                          ),
                          const Text(
                            '  Mobile Number',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          CustomTextfield(
                            keyboardtype: TextInputType.number,
                            controller: _mobile,
                            maxlength: 10,
                            hintText: 'Mobile Number',
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
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextfield(
                        readOnly: true,
                        hintText: 'Select Date',
                        width: 160,
                        borderRadius: 12,
                        controller: _dateController,
                        sufixIcon: Icons.calendar_month,
                        sufonpressed: () async {
                          final DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050));
                          if (date != null) {
                            setState(() {
                              _dateController.text =
                                  DateFormat('dd/MM/yyyy').format(date);
                            });
                          }
                        },
                      ),
                      CustomTextfield(
                        width: 160,
                        borderRadius: 12,
                        hintText: 'Select Time',
                        readOnly: true,
                        controller: _timeController,
                        sufixIcon: Icons.access_time_filled_sharp,
                        sufonpressed: () async {
                          final TimeOfDay? _time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          setState(() {
                            _timeController.text = _time!.format(context);
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CoustomButton(
                    width: 400,
                    borderRadius: 12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formDetails.addFormDetails(FormDb(
                          name: _name.text,
                          age: _age.text,
                          date: _dateController.text,
                          time: _timeController.text,
                          mobile: _mobile.text,
                          gender: gender!,
                          address: _address.text,
                          medicalHistory: _medicalHistory.text,
                          dentalHistory: _dentalHistory.text,
                          diet: _diet.text,
                          tobacco: _tobacco.text,
                          oral: _oral.text,
                          chief: _chief.text,
                        ));
                        const snackbar = SnackBar(
                          content: Text('Added to Case History'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        _name.clear();
                        _age.clear();
                        _dateController.clear();
                        _timeController.clear();
                        _mobile.clear();
                        _address.clear();
                        _medicalHistory.clear();
                        _dentalHistory.clear();
                        _diet.clear();
                        _tobacco.clear();
                        _oral.clear();
                        _chief.clear();
                        if (widget.leadIcon) {
                          Navigator.pop(context);
                        }
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
