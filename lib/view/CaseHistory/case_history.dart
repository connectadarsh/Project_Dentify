import 'package:dentify/controller/form_fn.dart';
import 'package:dentify/model/Appointment_db/appointment_db.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/utilities/custom_widgets/alert_box.dart';
import 'package:dentify/view/EditCaseHistory/edit_case_history.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CaseHistory extends StatelessWidget {
  const CaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final FormDetails formDetails=FormDetails();
    return Scaffold(
      appBar: AppBar(
       
        title: Text(
          'Histories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<FormDb>('FormBox').listenable(),
          builder: (context, Box<FormDb> box, child) {
            if (box.isEmpty) {
              return const Center(
                child: Text("No Histories Yet"),
              );
            } else {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final caseHistory = box.getAt(index) as FormDb;
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: InkWell(
                        onLongPress: (){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertBox(
                                  title: 'Are you sure want to Delete',
                                  decision1: 'yes',
                                  onPressed: () {
                                    formDetails.deleteFormDetails(index);
                                    Navigator.pop(context);
                                  },
                                  decision2: 'No',
                                );
                              });
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditCaseHistory(
                                  data: caseHistory,
                                  index: index,
                                ),
                              ));
                        },
                        child: Card(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${caseHistory.name}, ${caseHistory.age}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  caseHistory.gender,
                                  style:
                                      const TextStyle(color: Colors.blueGrey),
                                ),
                                // Text(
                                //   CaseHistory.,
                                //   style:
                                //       const TextStyle(color: Colors.blueGrey),
                                // )
                              ],
                            ),
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
