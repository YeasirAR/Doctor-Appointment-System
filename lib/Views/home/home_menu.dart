import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

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
        title: Text("More", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[100],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/menuperson.png'), color: Color(0xFF4368FF), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Refferal Points", style: TextStyle(fontSize: 16.sp),),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/vip.png'), color: Color(0xFF4368FF), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Membership", style: TextStyle(fontSize: 16.sp),),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/discount.png'), color: Color(0xFF4368FF), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Discount", style: TextStyle(fontSize: 16.sp),),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/first-aid-kit.png'), color: Color(0xFF4368FF), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Pharmacy", style: TextStyle(fontSize: 16.sp),),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/healthcare.png'), color: Color(0xFF4368FF), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Health Tips", style: TextStyle(fontSize: 16.sp),),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
