import 'dart:io';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/view/Crowns/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CrownsPage extends StatelessWidget {
  const CrownsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: Hive.box<CrownsDb>('CrownsBox').listenable(),
      builder: (BuildContext ctx, Box<CrownsDb> box, Widget? child) {
        List<CrownsDb> datas = box.values.where((braces) {
          return braces.category.contains('crowns');
        }).toList();
        if (box.isEmpty) {
          return const Center(
            child: Text('Add Your Models'),
          );
        }
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final crownsData = datas[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return DetailPage(data: datas[index],index: index,);
                  },));
                },
                onLongPress: (){

                },
                child: Card(

                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: FileImage(File(crownsData.image)),
                          fit: BoxFit.cover,
                        ),
                      ),
                       const SizedBox(height: 10),
                      Text('₹${crownsData.price}',
                      style: TextStyle(
                        fontSize: 16,
                          fontWeight: FontWeight.bold,
                      ),),
                      
                    ],
                  ),
                ),
              );
            });
      },
    ));
  }
}


