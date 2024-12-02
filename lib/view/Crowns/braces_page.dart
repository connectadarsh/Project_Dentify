import 'dart:io';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/view/Crowns/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BracesPage extends StatelessWidget {
  const BracesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<CrownsDb>('CrownsBox').listenable(),
        builder: (BuildContext ctx, Box<CrownsDb> box, Widget? child) {
          List<CrownsDb> datas = box.values.where((braces) {
            return braces.category.contains('braces');
          }).toList();

          // Display message if no data is available
          if (box.isEmpty) {
            return const Center(
              child: Text('Add Your Models'),
            );
          }

          // Grid view displaying data
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
              childAspectRatio: 1, // Aspect ratio for each grid item
            ),
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final bracesData = datas[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(data: datas[index], index: index);
                      },
                    ),
                  );
                },
                onLongPress: () {
                  // Handle long press for delete or any other functionality
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Display Image
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: FileImage(File(bracesData.image)),
                          fit: BoxFit.cover, // Ensures image fills the container
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Display Price
                      Text(
                        '₹${bracesData.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
