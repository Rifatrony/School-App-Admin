import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class FeesView extends StatelessWidget {
  const FeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Student Fees"),
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 40,
              child: Center(child: Text("Search Student")),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade400,
              ),
            ),

            SizedBox(height: 10,),

            Container(
              width: double.maxFinite,
              height: 140,
              child: Center(child: Text("Show Get Student")),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade400,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
