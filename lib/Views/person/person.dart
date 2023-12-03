import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../info/Address/address.dart';
import '../loginReg/login.dart';


class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final storage = FlutterSecureStorage();
  bool isLoading = true;
  String? userName = "";
  String? userPhone = "";
  String? userType = "";
  String? userCoin = "6000";



  @override
  void initState() {
    checkdata();
    super.initState();

  }

  // Check if auto-login is possible
  Future<void> checkdata() async {
    String? userNameTmp = await storage.read(key: 'Name');
    String? userTypeTmp = await storage.read(key: 'User_Type');
    String? userPhoneTmp = await storage.read(key: 'Phone');
    String? CoinPhoneTmp = await storage.read(key: 'Coin');
    setState(() {
      userName = userNameTmp;
      userPhone = userPhoneTmp!;
      userType = userTypeTmp!;
      userCoin = CoinPhoneTmp!;

    });

   
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            //top bar
            Container(
              height: 95.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF2553E5),
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, top: 20.w, bottom: 20.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doctor.png"),
                          radius: 20.h,
                        ),
                      ),
                    ),

                    SizedBox(width: 15.w,),

                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userName!, style: TextStyle(fontSize: 15.sp, color: Colors.white),),
                            Text(userPhone!, style: TextStyle(fontSize: 15.sp, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 45.w),
                      child: Row(
                        children: [
                          Center(
                            child: Text(userCoin!, style: TextStyle(fontSize: 25.sp, color: Colors.white)),
                          ),
                          SizedBox(width: 2.w), // Add some spacing between the text and the image
                          Image(
                            image: AssetImage('assets/images/coin.png'),
                            height: 35.h,
                            width: 35.h,
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h,),

            //history
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/history.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("History", style: TextStyle(fontSize: 16.sp),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //personal details
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/person.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Personal Details", style: TextStyle(fontSize: 16.sp),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //address
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Address()),
              );
            },
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/address.png'),
                  color: Color(0xFF2553E5),
                  height: 25.h,
                  width: 25.h,
                ),
                SizedBox(width: 30.w),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 16.sp),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
                SizedBox(width: 15.w),
              ],
            ),
          ),
        ),


        SizedBox(height: 20.h,),

            //payment method
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/payment.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Payment Method", style: TextStyle(fontSize: 16.sp),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //about
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/about.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("About", style: TextStyle(fontSize: 16.sp),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //help
            Padding(
              padding: EdgeInsets.only(left: 20.w,),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/images/help.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                  SizedBox(width: 30.w,),
                  Text("Help", style: TextStyle(fontSize: 16.sp),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

            //logout
            InkWell(
              onTap: () {
                storage.deleteAll();
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder:
                      (context)=>Login(),

                  ),
                      (Route<dynamic> route) => false,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.w,),
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/logout.png'), color: Color(0xFF2553E5), height: 25.h, width: 25.h,),
                    SizedBox(width: 30.w,),
                    Text("Log out", style: TextStyle(fontSize: 16.sp),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(width: 15.w,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
