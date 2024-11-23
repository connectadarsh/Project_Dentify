import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/Crowns/braces_page.dart';
import 'package:dentify/view/Crowns/crowns_page.dart';
import 'package:dentify/view/Crowns/selection_form.dart';

import 'package:flutter/material.dart';

class Maincrowns extends StatelessWidget {
  const Maincrowns({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            bottom: TabBar(tabs: [
            Tab(
              text: 'Braces',
            ),
            Tab(
              text: 'Crowns',
            )
          ]),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BracesPage(),

           CrownsPage(),
          ],
        ),
         floatingActionButton: FloatingActionButton(
      backgroundColor: AppColors.primary,
          child: Icon(Icons.add,color: AppColors.secondary,),
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionForm(),));
        },),
      ),
    );
   
}
}
