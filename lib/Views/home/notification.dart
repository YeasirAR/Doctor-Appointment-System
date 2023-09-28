import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Notifications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[100],
        centerTitle: false,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Image(image: AssetImage('assets/images/bell.png',), height: 20.h, width: 20.h, color: Color(0xFF4368FF),),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today 26 May, 2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 20.h,),
                Text("Today 25 May, 2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),

                SizedBox(height: 10.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                        SizedBox(width: 20.w,),
                        Text("you have appointment with dr. Karim at\n11.00am today.", style: TextStyle(fontSize: 13.sp),),
                        //SizedBox(height: 20.h,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text("Just Now", style: TextStyle(fontSize: 15.sp, color: Color(0xFF2553E5)),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
