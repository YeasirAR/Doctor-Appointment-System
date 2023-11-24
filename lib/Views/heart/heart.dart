import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heart extends StatelessWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.h),

              Text("Favourite Doctors",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2553E5),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
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
                                    Text("Dr. Karim", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                    Text("Speciality: Cardiology", style: TextStyle(fontSize: 8.sp),),
                                  ],
                                ),
                                SizedBox(width: 15.w,),
                                Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  height: 30.h,
                                  width: 30.w,
                                  color: Color(0xFFD60000),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 16.h,),
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
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              SizedBox(width: 1.w,),
                              Text("(5)", style: TextStyle(fontSize: 13.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
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
                                    Text("Dr. Karim", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                    Text("Speciality: Cardiology", style: TextStyle(fontSize: 8.sp),),
                                  ],
                                ),
                                SizedBox(width: 15.w,),
                                Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  height: 30.h,
                                  width: 30.w,
                                  color: Color(0xFFD60000),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 16.h,),
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
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              SizedBox(width: 1.w,),
                              Text("(5)", style: TextStyle(fontSize: 13.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
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
                                    Text("Dr. Karim", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                    Text("Speciality: Cardiology", style: TextStyle(fontSize: 8.sp),),
                                  ],
                                ),
                                SizedBox(width: 15.w,),
                                Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  height: 30.h,
                                  width: 30.w,
                                  color: Color(0xFFD60000),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 16.h,),
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
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              SizedBox(width: 1.w,),
                              Text("(5)", style: TextStyle(fontSize: 13.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
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
                                    Text("Dr. Karim", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                    Text("Speciality: Cardiology", style: TextStyle(fontSize: 8.sp),),
                                  ],
                                ),
                                SizedBox(width: 15.w,),
                                Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  height: 30.h,
                                  width: 30.w,
                                  color: Color(0xFFD60000),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 16.h,),
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
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              SizedBox(width: 1.w,),
                              Text("(5)", style: TextStyle(fontSize: 13.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
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
                                    Text("Dr. Karim", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 15.sp),),
                                    Text("Speciality: Cardiology", style: TextStyle(fontSize: 8.sp),),
                                  ],
                                ),
                                SizedBox(width: 15.w,),
                                Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  height: 30.h,
                                  width: 30.w,
                                  color: Color(0xFFD60000),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 16.h,),
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
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              SizedBox(width: 1.w,),
                              Text("(5)", style: TextStyle(fontSize: 13.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
