import 'package:easy_lab/Views/home/all_doctors.dart';
import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:easy_lab/components/health_package/appointment/form.dart';
import 'package:easy_lab/components/health_package/appointment/timing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Diabatic extends StatefulWidget {
  const Diabatic({Key? key}) : super(key: key);

  @override
  State<Diabatic> createState() => _DiabaticState();
}

class _DiabaticState extends State<Diabatic> {
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

            //body
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 35.h),
                  _buildPackageContainer(text: "Medinet Diabetic Health Check-up Package"),
                  SizedBox(height: 35.h),
                  _buildFeatureRow(
                    icon: Icons.circle,
                    text: "FBS (Fasting Blood Sugar)+CUS",
                  ),
                  _buildFeatureRow(
                    icon: Icons.circle,
                    text: "2Hrs after Breakfast+CUS",
                  ),
                  _buildFeatureRow(icon: Icons.circle, text: "OGTT"),
                  _buildFeatureRow(icon: Icons.circle, text: "HbA1C"),
                  _buildFeatureRow(icon: Icons.circle, text: "Creatinine"),
                  _buildFeatureRow(icon: Icons.circle, text: "SGPT"),
                  _buildFeatureRow(icon: Icons.circle, text: "CBC+ESR"),
                  _buildFeatureRow(icon: Icons.circle, text: "Urine R/E"),
                  _buildFeatureRow(icon: Icons.circle, text: "ECG"),
                  SizedBox(height: 20.h),
                ],
              ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentTime(
                      packageName: "Medinet Diabetic Health Check-up Package",
                      packageFee: "2500",
                    ),
                  ),
                );
              },
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
          ],
        ),
      ),
    );
  }
}
Widget _buildFeatureRow({required IconData icon, required String text}) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, bottom: 7.h),
      child: Row(
        children: [
          Icon(icon, size: 8.h, color: Color(0xFF4368FF)),
          SizedBox(width: 20.w),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF4368FF),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPackageContainer({required String text}) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
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
      child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }