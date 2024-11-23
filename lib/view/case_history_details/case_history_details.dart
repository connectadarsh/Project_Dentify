import 'package:dentify/model/form_db/form_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CaseHistoryDetails extends StatefulWidget {
  final int index;
  const CaseHistoryDetails({
    super.key,
    required this.index,
  });

  @override
  State<CaseHistoryDetails> createState() => _CaseHistoryDetailsState();
}

class _CaseHistoryDetailsState extends State<CaseHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<FormDb>('FormBox').listenable(),
      builder: (context, Box<FormDb> box, child) {
        var datas = box.values.toList().cast<FormDb>();
        var data = datas[widget.index];
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text(data.name),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
