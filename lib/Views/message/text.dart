import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageText extends StatelessWidget {
  const MessageText({Key? key}) : super(key: key);

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
        title: Text("Abdul Hasan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doctor.png"),
                        ),
                        SizedBox(width: 12.w,),
                        Container(
                          height: 30.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF2553E5),
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                          child: Center(child: Text("Hi Abir", style: TextStyle(color: Colors.white, fontSize: 14.sp),)),
                        ),
                        SizedBox(width: 12.w,),
                        Text("4:00", style: TextStyle(fontSize: 8.sp),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("4:01", style: TextStyle(fontSize: 8.sp),),
                        SizedBox(width: 12.w,),
                        Container(
                          height: 30.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF2553E5),
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                          child: Center(child: Text("Hi Abir", style: TextStyle(color: Colors.white, fontSize: 14.sp),)),
                        ),
                        SizedBox(width: 12.w,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/person.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doctor.png"),
                        ),
                        SizedBox(width: 12.w,),
                        Container(
                          height: 30.h,
                          width: 110.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF2553E5),
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                          child: Center(child: Text("How are you?", style: TextStyle(color: Colors.white, fontSize: 14.sp),)),
                        ),
                        SizedBox(width: 12.w,),
                        Text("4:02", style: TextStyle(fontSize: 8.sp),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("4:03", style: TextStyle(fontSize: 8.sp),),
                        SizedBox(width: 12.w,),
                        Container(
                          height: 30.h,
                          width:120.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF2553E5),
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                          child: Center(child: Text("I'm fine doctor", style: TextStyle(color: Colors.white, fontSize: 14.sp),)),
                        ),
                        SizedBox(width: 12.w,),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/person.png"),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      height: 30.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2),
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
                                  style: TextStyle(fontSize: 12.sp,),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Message',
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Image.asset(
                                        "assets/images/smile.png",
                                        color: Color(0xFF4368FF),
                                        height: 15.h,
                                        width: 15.w,
                                      ),
                                    ),
                                  ),
                                  autocorrect: true,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/camera.png",
                            color: Color(0xFF4368FF),
                            height: 18.h,
                            width: 18.w,
                          ),
                          SizedBox(width: 12.w),
                          Image.asset(
                            "assets/images/microphone.png",
                            color: Color(0xFF4368FF),
                            height: 18.h,
                            width: 18.w,
                          ),
                          SizedBox(width: 12.w),
                          Image.asset(
                            "assets/images/send-message.png",
                            color: Color(0xFF4368FF),
                            height: 18.h,
                            width: 18.w,
                          ),
                          SizedBox(width: 12.w),
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
