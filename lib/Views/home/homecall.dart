import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252D2E),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.all(5.h),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/doctor.png"),
                  radius: 80.h,
                ),
              ),
            ),
            Spacer(),
            Text("Calling...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            Text("Dr. Karim",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20.h),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.h),
                        child: Image.asset(
                          "assets/images/phone-call.png",
                          color: Color(0xFF252D2E),
                          width: 20.w,
                          height: 20.h,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.h),
                        child: Image.asset(
                          "assets/images/zoom.png",
                          color: Color(0xFF252D2E),
                          width: 20.w,
                          height: 20.h,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.h),
                        child: Image.asset(
                          "assets/images/microphone.png",
                          color: Color(0xFF252D2E),
                          width: 20.w,
                          height: 20.h,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.h),
                          child: Image.asset(
                            "assets/images/phone-call.png",
                            color: Color(0xFF252D2E),
                            width: 20.w,
                            height: 20.h,
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
