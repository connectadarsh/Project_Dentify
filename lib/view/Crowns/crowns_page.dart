

import 'dart:io';

import 'package:dentify/model/Braces_db/braces_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/view/Crowns/braces_floating.dart';
import 'package:dentify/view/Crowns/crowns_floating.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrownsPage extends StatelessWidget {
  const CrownsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CrownsFloating(),
    body: ValueListenableBuilder(
      valueListenable: Hive.box<CrownsDb>('CrownsBox').listenable(),
      builder:
          (BuildContext ctx, Box<CrownsDb> box, Widget? child) {
              if(box.isEmpty){
          return const Center(child: Text('Add Your Models'),);
        }
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: box.length,
            itemBuilder: (context, index) {
              final crownsData = box.getAt(index);
              return InkWell(
                onTap: (){
                },
                child:Card(
                  child: Image(
                    image: FileImage(File(crownsData!.image)), 
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            });
      },
    )
    );
  }
}