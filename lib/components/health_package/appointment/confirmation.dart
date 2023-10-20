import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class ConfirmAppoinment extends StatelessWidget {
  // const Confirmation({Key? key}) : super(key: key);
  final String packageName;
  final String packageFee;
  final String appoinmentDate;
  final String appoinmentSlot;
  final String patientName;
  final String patientAgeYear;
  final String patientAgeMonth;
  final String patientWeight;
  final String phoneNo;
  final String address;
  final String sampleCollection;

  ConfirmAppoinment({
    required this.packageName,
    required this.packageFee,
    required this.appoinmentDate,
    required this.appoinmentSlot,
    required this.patientName,
    required this.patientAgeYear,
    required this.patientAgeMonth,
    required this.patientWeight,
    required this.phoneNo,
    required this.address,
    required this.sampleCollection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Confirmation", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF2553E5),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(image: AssetImage("assets/images/like.png"),
              height: 100.h,
              width: 100.w,
              color: Color(0xFF2553E5),
              ),
            ),
            SizedBox(height: 30.h,),
            Center(child: Text("Thank You!", style: TextStyle(color:Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 18.sp),)),
            SizedBox(height: 10.h,),
            Center(child: Text("You bought $packageName!", style: TextStyle(color:Color(0xFF2553E5), fontWeight: FontWeight.bold, fontSize: 12.sp),)),
            SizedBox(height: 15.h,),
            Center(child: Text(
    "Your appointment is on $appoinmentDate at $appoinmentSlot.",
    style: TextStyle(fontSize: 12.sp),)),
          ],
        ),
      ),
    );
  }
}
