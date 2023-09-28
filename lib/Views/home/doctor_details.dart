import 'package:easy_lab/Views/home/homecall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DoctorDetails extends StatelessWidget {

  final Map<String, dynamic> MjsonData;

  DoctorDetails({required this.MjsonData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF2553E5),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Doctor Details", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Container(
                  height: 150.h,
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
                            backgroundImage: NetworkImage(MjsonData['image']),
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
                                    Text( MjsonData['name'], style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 10.sp),),
                                    SizedBox(height: 15.h,),
                                    Text("Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, \nsed diam nonummy nibh \neuismod tincidunt ut laoreet \ndolore magna aliquam \nerat volutpat. Ut wis", style: TextStyle(fontSize: 8.sp, color: Color(0xFF000000)),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
                              Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 18.h,
                                width: 18.h,
                              ),
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
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Call(),),);
                      },
                      child: Container(
                        height: 22.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFD5DAF2),
                          borderRadius: BorderRadius.circular(5.h),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 9,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/phone-call.png'), height: 10.h, width: 10.h, color: Color(0xFF2553E5),),
                            SizedBox(width: 8.w,),
                            Text("Audio Call", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 22.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD5DAF2),
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/zoom.png'), height: 15.h, width: 15.h, color: Color(0xFF2553E5),),
                          SizedBox(width: 7.w,),
                          Text("Video Call", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Container(
                      height: 22.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD5DAF2),
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/chat.png'), height: 10.h, width: 10.h, color: Color(0xFF2553E5),),
                          SizedBox(width: 8.w,),
                          Text("Message", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MjsonData['specialty'], textAlign: TextAlign.start, style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 16.sp),),
                    SizedBox(height: 8.h,),
                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna",  textAlign: TextAlign.justify, style: TextStyle(fontSize: 10.sp),),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About the Doctor", textAlign: TextAlign.start, style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 16.sp),),
                    SizedBox(height: 8.h,),
                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation"
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation"
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation"
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation"
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 10.sp
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD5DAF2),
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Patients", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                          Text("2.5k", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD5DAF2),
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Experiences", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                          Text("7+ Years", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD5DAF2),
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Review", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                          Text("2k", style: TextStyle(color: Color(0xFF2553E5), fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}
