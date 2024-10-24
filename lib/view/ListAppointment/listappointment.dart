import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Listappointment extends StatelessWidget {
  const Listappointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [
        InkWell(child: Icon(Icons.filter_list))
      ],
        title: Text('Your Appointments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
              ),
      ),
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<AppointmentDb>('AppointmentBox').listenable(),
          builder: (context, Box<AppointmentDb> box, child) {
            if (box.isEmpty) {
              return const Center(
                child: Text("You don't have any appointments yet"),
              );
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final patientAppoitment = box.getAt(index) as AppointmentDb;
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Card(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${patientAppoitment.date}, ${patientAppoitment.time}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                patientAppoitment.patientName,
                                style:
                                    const TextStyle(color: Colors.blueGrey),
                              ),
                              Text(
                                patientAppoitment.city.toString(),
                                style:
                                    const TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
