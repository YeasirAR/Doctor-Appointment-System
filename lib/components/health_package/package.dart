import 'package:easy_lab/Views/home/all_doctors.dart';
import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:easy_lab/components/health_package/Kidney.dart';
import 'package:easy_lab/components/health_package/diabatic.dart';
import 'package:easy_lab/components/health_package/heart.dart';
import 'package:easy_lab/components/health_package/liver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EasyPackage extends StatefulWidget {
  const EasyPackage({Key? key}) : super(key: key);

  @override
  State<EasyPackage> createState() => _EasyPackageState();
}

class _EasyPackageState extends State<EasyPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 142.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF4368FF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.w, right: 23.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Image(
                              image: AssetImage("assets/images/Logo.png"),
                              height: 60.h,
                              width: 60.w,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              },
                              child: Image(
                                image: AssetImage("assets/images/cart.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notifications()),
                                );
                              },
                              child: Image(
                                image: AssetImage("assets/images/bell.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeMenu(),
                                  ),
                                );
                              },
                              child: Image(
                                image: AssetImage("assets/images/menu.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Text(
                      "Saving Times, Saves Lives.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      height: 38.h,
                      width: 310.w,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(8.h),
                      //   color: Colors.white,
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black38.withOpacity(0.2),
                      //       spreadRadius: 5,
                      //       blurRadius: 7,
                      //       offset: Offset(0, 5),
                      //     ),
                      //   ],
                      // ),
                      child: Center(
                        child: Container(
                          width: double
                              .infinity, // Ensure the container takes up the full width
                          child: Stack(
                            alignment: Alignment
                                .center, // Center the content of the Stack
                            children: <Widget>[
                              // First child (left-aligned)
                              Positioned(
                                left: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                    size: 36.0, // Adjust the size as needed
                                  ),
                                  onPressed: () {
                                    // Handle button press
                                    // pop to the previous screen
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              // Second child (centered)
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  '   Easy Health Packages   ',
                                  style: TextStyle(
                                    color: Color(0xFF4368FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  //pics1
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Heart()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 7.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Heart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Liver()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 2 copy.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Liver",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Diabatic()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 9.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Diabatic",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //pics2
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Kidney()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 1 copy.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Kidney",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),],
                    ),
                  ),
                  ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
