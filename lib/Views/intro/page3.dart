import 'package:easy_lab/Views/intro/page1.dart';
import 'package:easy_lab/Views/intro/page2.dart';
import 'package:easy_lab/Views/intro/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../loginReg/login.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

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
                    "assets/images/illustrations-04.png"
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
                child: Text("Consult your problems with your doctors and easy to connect with better treatment.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                      fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 70.h,),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageFour(),),);
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
                  child: Text("Next",
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

            SizedBox(height: 25.h,),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
              },
              child: Center(
                child: Text("Skip",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 60.h,),

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
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF4368FF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
                SizedBox(width: 12.w,),
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.black54,
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
