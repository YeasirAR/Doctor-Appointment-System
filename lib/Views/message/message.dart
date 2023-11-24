import 'package:easy_lab/Views/message/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Center(
                child: Container(
                  height: 30.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF2553E5),
                    borderRadius: BorderRadius.circular(10.h),
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
                    child: Text("Message",
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
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 30.h,
                  width: 320.w,
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
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: TextField(
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp, color: Color(0xFF4368FF),),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Doctors',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF4368FF),
                                  ),
                                ),
                              ),
                              autocorrect: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MessageText(),),);
                  },
                  child: Container(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.h),
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/doctor.png"),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                            SizedBox(height: 3.h,),
                            Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("4:00", style: TextStyle(fontSize: 8.sp),),
                            SizedBox(height: 5.h,),
                            Container(
                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2553E5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text("2",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hasan", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                          SizedBox(height: 3.h,),
                          Text("Thank you for being a great doctor", style: TextStyle(fontSize: 8.sp),),
                        ],
                      ),
                      Spacer(),
                      Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
            ],
          ),
        )
      ),
    );
  }
}
