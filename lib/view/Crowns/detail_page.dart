import 'dart:io';
import 'package:dentify/controller/crowns_fn.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/alert_box.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final CrownsDb data;
  final int index;
  const DetailPage({super.key, required this.data, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CrownsDetails crownsDetails = CrownsDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondary),
        title: Text(
          widget.data.category,
        ),
        backgroundColor: AppColors.primary,
        titleTextStyle:
            const TextStyle(color: AppColors.secondary, fontSize: 23),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle your actions here
              print("Selected: $value");
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertBox(
                        onPressed: () {
                          crownsDetails.deleteCrownsDetails(widget.data.id!);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        title: 'Are You Sure Want To Delete',
                        decision1: 'Yes',
                        decision2: 'No',
                      ),
                    );
                  },
                  value: "Option 2",
                  child: const Text("Delete"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(widget.data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '₹:${widget.data.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.primary,
              ),
            ),
            Text('Material:${widget.data.id}'),
          ],
        ),
      ),
    );
  }
}
