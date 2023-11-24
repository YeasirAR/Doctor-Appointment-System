import 'package:easy_lab/Views/intro/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
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
                    "assets/images/illustrations-01.png"
                ),
                height: 250.h,
                width: 250.w,
              ),
            ),
            
            SizedBox(height: 30.h,),
            
            //bold text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text("Get all types of medical help",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  fontFamily: 'Helvetica'
                ),
              ),
            ),

            SizedBox(height: 20.h,),

            //opacity text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Center(
                child: Text("Welcome to our medical app, the all-in-one solution for managing your health and wellness. With our app, you have access to top-quality medical care anytime, anywhere. You can stay on top of your health with our user-friendly tools and resources which are designed to help you track your sump-toms, monitor your progress, and make informed  health decisions.",
                textAlign: TextAlign.center,
                  style: TextStyle(
                     fontSize: 13.sp,
                     color: Colors.grey[700],
                     fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h,),

            //get started
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageOne(),),);
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
                  child: Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica'
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
