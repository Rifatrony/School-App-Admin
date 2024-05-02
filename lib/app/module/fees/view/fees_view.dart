import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srmm/app/widget/button/custom_button.dart';

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

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: false,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w,),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          hintText: "Student ID",
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.w,),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                  ),
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              color: Colors.white,
              elevation: 3,
              shadowColor: Colors.grey.shade200,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  children: [

                    CircleAvatar(
                      radius: 40.r,
                    ),

                    SizedBox(width: 10.w,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Student ID: 22222222"),
                        Text("Student Name: Rony"),
                        Text("Father Name: Shoharab"),
                      ],
                    ),

                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
