
import 'package:dentify/controller/appointment_fn.dart';
import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/alert_box.dart';
import 'package:dentify/view/Appointment/mainAppointment.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Listappointment extends StatefulWidget {
  const Listappointment({super.key});

  @override
  State<Listappointment> createState() => _ListappointmentState();
}

class _ListappointmentState extends State<Listappointment> {
  AppointmentDetails appointmentDetails = AppointmentDetails();
  List<AppointmentDb> _filteredAppointments = [];
  List<AppointmentDb> _allAppointments = [];

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  void _loadAppointments() {
    final box = Hive.box<AppointmentDb>('AppointmentBox');
    setState(() {
      _allAppointments = box.values.toList();
      _filteredAppointments = List.from(_allAppointments);
    });
  }

  void _search(String searchData) {
    setState(() {
      _filteredAppointments = _allAppointments.where((value) {
        final nameLower = value.patientName.toLowerCase();
        final cityLower = value.city.toLowerCase();
        final queryLower = searchData.toLowerCase();
        return nameLower.contains(queryLower) || cityLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Your Appointments',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              
              onChanged: (value) => _search(value),
              decoration:  InputDecoration(
                focusColor: AppColors.primary,
                enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:  BorderSide(color: AppColors.primary)
              ) ,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                
                borderSide:  BorderSide(color: AppColors.primary,width: 2)
              ),
                disabledBorder:OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(30),
                borderSide:  BorderSide(color: Colors.blueGrey)
              )  ,
                suffixIcon:Icon(Icons.search) ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
                hintText: 'Search by name or city...',
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<AppointmentDb>('AppointmentBox').listenable(),
        builder: (context, Box<AppointmentDb> box, child) {
          if (_allAppointments.isEmpty) {
            return const Center(
              child: Text("You don't have any appointments yet"),
            );
          } else if (_filteredAppointments.isEmpty) {
            return const Center(
              child: Text("No results found"),
            );
          } else {
            return ListView.builder(
              itemCount: _filteredAppointments.length,
              itemBuilder: (context, index) {
                final patientAppointment = _filteredAppointments[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertBox(
                            title: 'Are you sure you want to Delete?',
                            decision1: 'Yes',
                            onPressed: () async {
                              // Delete appointment and reload the list
                              await appointmentDetails.deleteAppointmnet(index);
                              Navigator.pop(context);
                              _filteredAppointments.removeAt(index);
                            },
                            decision2: 'No',
                          );
                        },
                      );
                    },
                    child: Card(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${patientAppointment.date}, ${patientAppointment.time}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              patientAppointment.patientName,
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                            Text(
                              patientAppointment.city,
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        
        onPressed: () async {
          // Navigate to add appointment screen and wait for result
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainAppointment(
                leadIcon: true,
              ),
            ),
          );
          // Reload appointments after adding
          _loadAppointments();
        },
        child: const Icon(Icons.add,color: AppColors.secondary,),
        
      ),
    );
  }
}
