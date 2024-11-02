

import 'dart:io';

import 'package:dentify/model/Braces_db/braces_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BracesPage extends StatelessWidget {
  const BracesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ValueListenableBuilder(
      valueListenable: Hive.box<BracesDb>('BracesBox').listenable(),
      builder:
          (BuildContext ctx, Box<BracesDb> box, Widget? child) {
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
              final bracesData = box.getAt(index);
              return InkWell(
                onTap: (){
                },
                child:Card(
                  child: Image(
                    image: FileImage(File(bracesData!.image)), 
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