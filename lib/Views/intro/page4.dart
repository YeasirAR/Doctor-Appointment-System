import 'package:easy_lab/Views/intro/page1.dart';
import 'package:easy_lab/Views/intro/page2.dart';
import 'package:easy_lab/Views/intro/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loginReg/login.dart';

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h,),

            //image
            Center(
              child: Image(
                image: AssetImage(
                    "assets/images/illustrations-05.png"
                ),
                height: 250.h,
                width: 250.w,
              ),
            ),

            SizedBox(height: 35.h,),

            //text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Center(
                child: Text("24/7 doctor avaiability",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                      fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 85.h,),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
              },
              child: Container(
                height: 35.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Color(0xFF4368FF),
                  borderRadius: BorderRadius.circular(10.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text("Start",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 95.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageOne(),),);
                  },
                  child: Container(
                    height: 4.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                  ),
                ),
                SizedBox(width: 12.w,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo(),),);
                  },
                  child: Container(
                    height: 4.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                  ),
                ),
                SizedBox(width: 12.w,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageThree(),),);
                  },
                  child: Container(
                    height: 4.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                  ),
                ),
                SizedBox(width: 12.w,),
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF4368FF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
