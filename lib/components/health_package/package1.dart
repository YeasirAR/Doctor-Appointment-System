import 'package:easy_lab/Views/home/all_doctors.dart';
import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EasyPackage1 extends StatefulWidget {
  const EasyPackage1({Key? key}) : super(key: key);

  @override
  State<EasyPackage1> createState() => _EasyPackage1State();
}

class _EasyPackage1State extends State<EasyPackage1> {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 36.0, // Adjust the size as needed
                            ),
                            onPressed: () {
                              // Handle button press
                              // pop to previous screen
                              Navigator.pop(context);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 36.0, // Adjust the size as needed
                            ),
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            //body
            Expanded(
              child: Column(children: [
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    color: Color(0xFF4368FF),
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
                    '   Medinet Diabetic Health Check-up Package   ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "FBS (Fasting Blood Sugar)+CUS",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "2Hrs after Breakfast+CUS",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "OGTT",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "HbA1C",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Creatinine",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "SGPT",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "CBC+ESR",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Urine R/E",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "ECG",
                        style: TextStyle(
                            color: Color(0xFF4368FF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
                backgroundColor: Color(0xFF4368FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              child: const Text(
                '  Total: 2500/- ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
                backgroundColor: Color(0xFF4368FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              child: const Text(
                'Make an Appointment',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // Container(
            //   padding:
            //       EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8.h),
            //     color: Color(0xFF4368FF),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black38.withOpacity(0.2),
            //         spreadRadius: 5,
            //         blurRadius: 7,
            //         offset: Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   child: const Text(
            //     '  Total: 2500/- ',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // Container(
            //   padding:
            //       EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 15),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8.h),
            //     color: Color(0xFF4368FF),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black38.withOpacity(0.2),
            //         spreadRadius: 5,
            //         blurRadius: 7,
            //         offset: Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   child: const Text(
            //     '  Make an Appointment  ',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
          ],
        ),
      ),
    );
  }
}
