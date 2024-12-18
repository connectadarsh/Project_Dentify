import 'package:dentify/controller/appointment_fn.dart';
import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainAppointment extends StatefulWidget {
  final bool leadIcon;
  const MainAppointment({super.key, required this.leadIcon});

  @override
  State<MainAppointment> createState() => _MainAppointmentState();
}

class _MainAppointmentState extends State<MainAppointment> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppointmentDetails _appointmentDetails = AppointmentDetails();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          centerTitle: true,
          leading: (widget.leadIcon)
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  
                  )
              : Container(),
          title: const Text(
            'Appointments',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        backgroundColor: AppColors.secondary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '    Patient Name',
                    style: TextStyle(
                        color: AppColors.titile, fontWeight: FontWeight.w600),
                  ),
                  CustomTextfield(
                    controller: nameController,
                    borderRadius: 12,
                    hintText: 'Patient Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '    Mobile Number',
                    style: TextStyle(
                        color: AppColors.titile, fontWeight: FontWeight.w600),
                  ),
                  CustomTextfield(
                    controller: mobileController,
                    keyboardtype: TextInputType.phone,
                    maxlength: 10,
                    borderRadius: 12,
                    hintText: 'Mobile Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '    City/Place',
                    style:  TextStyle(
                        color: AppColors.titile, fontWeight: FontWeight.w600),
                  ),
                  CustomTextfield(
                    controller: cityController,
                    borderRadius: 12,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextfield(
                        readOnly: true,
                        hintText: 'Select Date',
                        width: 160,
                        borderRadius: 12,
                        controller: dateController,

                        sufixIcon: Icons.calendar_month,
                        sufonpressed: () async {
                          final DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050));
                          if (date != null) {
                            setState(() {
                              dateController.text =
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
                        controller: timeController,
                        sufixIcon: Icons.access_time_filled_sharp,
                        sufonpressed: () async {
                          final TimeOfDay? _time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          setState(() {
                            timeController.text = _time!.format(context);
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  CoustomButton(
                    width: 400,
                    borderRadius: 12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _appointmentDetails.addAppointmentDetails(AppointmentDb(
                            patientName: nameController.text,
                            mobileNumber: mobileController.text,
                            city: cityController.text,
                            date: dateController.text,
                            time: timeController.text));
                        const snackbar = SnackBar(
                          content: Text('Added to appointments'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        nameController.clear();
                        mobileController.clear();
                        cityController.clear();
                        dateController.clear();
                        timeController.clear();
                       if(widget.leadIcon)
                       { 
                        Navigator.pop(context);
                       }
                      }
                    },
                    text: 'Add Appointment',
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
