import 'package:dentify/controller/form_fn.dart';
import 'package:dentify/model/form_db/form_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/alert_box.dart';
import 'package:dentify/view/EditCaseHistory/edit_case_history.dart';
import 'package:dentify/view/Form/main_form.dart';
import 'package:dentify/view/case_history_details/case_history_details.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CaseHistory extends StatefulWidget {
  const CaseHistory({super.key});

  @override
  State<CaseHistory> createState() => _CaseHistoryState();
}

class _CaseHistoryState extends State<CaseHistory> {
  final FormDetails formDetails = FormDetails();
  String searchQuery = '';
  late List<FormDb> filterData = [];

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
          'Histories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                focusColor: AppColors.primary,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: AppColors.primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blueGrey)),
                suffixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Search by name or mobile...',
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<FormDb>('FormBox').listenable(),
        builder: (context, Box<FormDb> box, child) {
          var data = box.values.toList().cast<FormDb>();
          // search filtering
          filterData = searchQuery.isEmpty
              ? data
              : data.where((value) {
                  final nameLower = value.name.toLowerCase();
                  final ageLower = value.age.toLowerCase();
                  final queryLower = searchQuery.toLowerCase();
                  return nameLower.contains(queryLower) ||
                      ageLower.contains(queryLower);
                }).toList();

          if (data.isEmpty) {
            return const Center(
              child: Text("You don't have any case histories yet"),
            );
          } else if (filterData.isEmpty) {
            return const Center(
              child: Text("No results found"),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: filterData.length,
                    itemBuilder: (context, index) {
                      final patientCasehistory = filterData[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditCaseHistory(
                                  data: patientCasehistory, index: index),
                            ));
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertBox(
                                  title: 'Are you sure you want to Delete?',
                                  decision1: 'Yes',
                                  onPressed: () async {
                                    await formDetails.deleteFormDetails(index);
                                    Navigator.pop(context);
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
                                    patientCasehistory.name,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  // const SizedBox(height: 8),
                                  Text(
                                    patientCasehistory.age,
                                    style:
                                        const TextStyle(color: Colors.blueGrey),
                                  ),
                                  Text(
                                    patientCasehistory.mobile,
                                    style:
                                        const TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MainForm(
                      leadIcon: true,
                    )),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}











// import 'package:dentify/controller/form_fn.dart';
// import 'package:dentify/model/form_db/form_db.dart';
// import 'package:dentify/utilities/colors/colors.dart';
// import 'package:dentify/utilities/custom_widgets/alert_box.dart';
// import 'package:dentify/view/EditCaseHistory/edit_case_history.dart';
// import 'package:dentify/view/Form/main_form.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class CaseHistory extends StatefulWidget {
//   const CaseHistory({super.key});

//   @override
//   State<CaseHistory> createState() => _CaseHistoryState();
// }

// class _CaseHistoryState extends State<CaseHistory> {
//      final FormDetails formDetails=FormDetails();
//    List<FormDb> _filteredHistories = [];
//   List<FormDb> _allCaseHistory = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadCasehistory();
//   }

//   void _loadCasehistory() {
//     final box = Hive.box<FormDb>('FormBox');
//     setState(() {
//       _allCaseHistory = box.values.toList();
//       _filteredHistories = List.from(_allCaseHistory);
//     });
//   }

//   void _search(String searchData) {
//     setState(() {
//       _filteredHistories = _allCaseHistory.where((value) {
//         final nameLower = value.name.toLowerCase();
//         final ageLower = value.age.toLowerCase();
//         final queryLower = searchData.toLowerCase();
//         return nameLower.contains(queryLower) || ageLower.contains(queryLower);
//       }).toList();
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
 
//     return Scaffold(
   
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text(
//           'Histories',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(80.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
              
//               onChanged: (value) => _search(value),
//               decoration:  InputDecoration(
//                 focusColor: AppColors.primary,
//                 enabledBorder:OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide:  const BorderSide(color: AppColors.primary)
//               ) ,
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
                
//                 borderSide:  const BorderSide(color: AppColors.primary,width: 2)
//               ),
//                 disabledBorder:OutlineInputBorder(
                
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide:  const BorderSide(color: Colors.blueGrey)
//               )  ,
//                 suffixIcon:const Icon(Icons.search) ,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20)
//               ),
//                 hintText: 'Search by name or mobile...',
//               ),
//             ),
//           ),
//         ),
//       ),
//        body: ValueListenableBuilder(
//         valueListenable: Hive.box<FormDb>('FormBox').listenable(),
//         builder: (context, Box<FormDb> box, child) {
//           if (_allCaseHistory.isEmpty) {
//             return const Center(
//               child: Text("You don't have any case histories yet"),
//             );
//           } else if (_filteredHistories.isEmpty) {
//             return const Center(
//               child: Text("No results found"),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: _filteredHistories.length,
//               itemBuilder: (context, index) {
                
//                 final patientCasehistory = _filteredHistories[index];
//                 return Padding(
//                   padding:
//                       const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(builder:(context) => EditCaseHistory(data: patientCasehistory, index: index),));
//                     },
//                     onLongPress: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return CustomAlertBox(
//                             title: 'Are you sure you want to Delete?',
//                             decision1: 'Yes',
//                             onPressed: () async {
//                               await formDetails.deleteFormDetails(index);
//                               Navigator.pop(context);
//                               _filteredHistories.removeAt(index);
//                             },
//                             decision2: 'No',
//                           );
//                         },
//                       );
//                     },
//                     child: Card(
//                       color: Colors.white70,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               patientCasehistory.name,
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                             // const SizedBox(height: 8),
//                             Text(
//                               patientCasehistory.age,
//                               style: const TextStyle(color: Colors.blueGrey),
//                             ),
//                             Text(
//                               patientCasehistory.mobile,
//                               style: const TextStyle(color: Colors.blueGrey),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//         floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.primary,
        
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const MainForm(leadIcon: true,)
//             ),
//           );
//           _loadCasehistory();
//         },
//         child: const Icon(Icons.add,color: AppColors.secondary,),
        
//       ),
    
//     );
//   }
// }