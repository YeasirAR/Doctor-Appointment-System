import 'package:easy_lab/Views/home/all_doctors.dart';
import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
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
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                                  child: Text(
                                    'Special Offers',
                                    style: TextStyle(
                                      color: Color(0xFF4368FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
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

            //body
            Expanded(
              child: Column(children: [
                // SizedBox(
                //   height: 35.h,
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
                //     '   Medinet Diabetic Health Check-up Package   ',
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 25.0),
                  child: Text(
                    "Buy our membership card to enjoy 25% discount on all lab test around the year.",
                    style: TextStyle(
                        color: Color(0xFF4368FF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "2Hrs after Breakfast+CUS",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "OGTT",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "HbA1C",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "Creatinine",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "SGPT",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "CBC+ESR",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "Urine R/E",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, bottom: 7.0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.circle, size: 8, color: Color(0xFF4368FF)),
                //       SizedBox(
                //         width: 20.w,
                //       ),
                //       Text(
                //         "ECG",
                //         style: TextStyle(
                //             color: Color(0xFF4368FF),
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // )


                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15.h),



                        Padding(
                          padding: EdgeInsets.only(left: 30.w, right: 25.w),
                          child: SingleChildScrollView (
                          child: Container(
                            height: 160.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9EDFF),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 145.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD5DAF2),
                                    borderRadius: BorderRadius.circular(12.h),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.h),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/doctor.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w,),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("কার্ডিয়াক (হার্ট)", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                              Text("-> ECG", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> Echocardiogram", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> Troponin-l ", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> FBS (Fasting Blood Sugar )", style: TextStyle(fontSize: 8.sp),),
                                              Text("->  Fasting Lipid Profile", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> Creatinine", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> CBC+ESR", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> Digital X-Ray(Chest P/A view)", style: TextStyle(fontSize: 8.sp),),
                                              Text("৭২৩০/-", style: TextStyle(fontSize: 12.sp,decoration: TextDecoration.lineThrough),),
                                              Text("Total:৩৬০০/-", style: TextStyle(fontSize: 14.sp),),

                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.zero,
                                          child: Container(
                                            height: 20.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF2553E5),
                                              borderRadius: BorderRadius.circular(5.h),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child:
                                              Text("Appoinment",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15.w,),

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ),

                        SizedBox(height: 20.h),

                        Padding(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: SingleChildScrollView (
                          child: Container(
                            height: 160.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9EDFF),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 145.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD5DAF2),
                                    borderRadius: BorderRadius.circular(12.h),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.h),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/doctor.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w,),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("হেপাটিক (লিভার)", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                              Text("-> Total Bilirubin", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> SGPT", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> SGOT", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> ALP (Alkaline Phosphatase)", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> HbsAg", style: TextStyle(fontSize: 8.sp),),
                                              Text("-> Anli HCV", style: TextStyle(fontSize: 8.sp),),
                                              Text("৪৪৬০/-", style: TextStyle(fontSize: 12.sp,decoration: TextDecoration.lineThrough),),
                                              Text("Total:২৫০০/-", style: TextStyle(fontSize: 14.sp),),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.zero,
                                          child: Container(
                                            height: 20.h,
                                            width: 75.w,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF2553E5),
                                              borderRadius: BorderRadius.circular(5.h),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child:
                                              Text("Appoinment",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ),

                        SizedBox(height: 20.h),

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
                            'Buy Membership Card',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),


                      ],
                    ),
                  ),
                ),















              ]),
            ),


          ],
        ),
      ),
    );
  }
}
