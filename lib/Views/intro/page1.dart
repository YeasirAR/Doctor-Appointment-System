import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loginReg/login.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final List<String> images = [
    "assets/images/illustrations-02.png",
    "assets/images/illustrations-03.png",
    "assets/images/illustrations-04.png",
    "assets/images/illustrations-05.png",
  ];

  final List<String> texts = [
    "Hundreds of specialists get medical advice & treatment service from specialist doctor anytime.",
    "Advice from nearest doctors. Find the doctors and make appointments.\n",
    "Consult your problems with your doctors and easy to connect with better treatment.\n",
    "24/7 doctor avaiability\n\n",
  ];
  int index = 0;
  List<Color> colors = [
    Color(0xFF4368FF),
     Colors.black54,
    Colors.black54,
    Colors.black54,
  ];
  void alternateColor(int idx){
    for(int i=0; i<4; i++){
      if(i == idx){
        colors[i] = Color(0xFF4368FF);
      }
      else{
        colors[i] = Colors.black54;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h,),

            //image
            Center(
              child: Image(
                image: AssetImage(
                    images[index]),
                height: 250.h,
                width: 250.w,
              ),
            ),

            SizedBox(height: 35.h,),

            //text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Center(
                child: Text(texts[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                      fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 60.h,),

            InkWell(
              onTap: () {
                setState(() {
                  if(index == 3){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),),);
                  }
                  else{
                    index++;
                    alternateColor(index);
                  }
                });
              },
              child: Container(
                height: 35.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF4368FF),
                  borderRadius: BorderRadius.circular(10.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text("Next",
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

            SizedBox(height: 25.h,),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),),);
              },
              child: Center(
                child: Text("Skip",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica'
                  ),
                ),
              ),
            ),

            SizedBox(height: 60.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: colors[0],
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
                SizedBox(width: 12.w,),
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: colors[1],
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
                SizedBox(width: 12.w,),
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: colors[2],
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
                SizedBox(width: 12.w,),
                Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: colors[3],
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
