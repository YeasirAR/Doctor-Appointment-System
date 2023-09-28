import 'package:easy_lab/Views/clock/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:easy_lab/Core/api_client.dart';

class DoctorForm extends StatefulWidget {
  // const DoctorForm({Key? key}) : super(key: key);
  final String doctorName;
  final String appoinmentFee;
  final String appoinmentDate;
  final String appoinmentSlot;

  DoctorForm({
    required this.doctorName,
    required this.appoinmentFee,
    required this.appoinmentDate,
    required this.appoinmentSlot,
  });

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  final ApiClient _apiClient = ApiClient();

  String patientName = "";

  String patientAgeYear = "";

  String patientAgeMonth = "";

  String patientWeight = "";

  String patientProblem = "";

  String patientReport = "";

  @override
  Widget build(BuildContext context) {
    Future<void> makeAppoinment() async {
      Map<String, dynamic> appoinmentInfo = {
        "DoctorName": widget.doctorName,
        "AppoinmentFee": widget.appoinmentFee,
        "AppoinmentDate": widget.appoinmentDate,
        "AppoinmentSlot": widget.appoinmentSlot,
        "PatientName": patientName,
        "PatientAgeYear": patientAgeYear,
        "PatientAgeMonth": patientAgeMonth,
        "PatientWeight": patientWeight,
        "PatientProblem": patientProblem,
        "PatientReport": patientReport,
        "References": "N/A",
      };
      print(appoinmentInfo);
      dynamic res = await _apiClient.makeAppoinment(appoinmentInfo);

      var response = json.decode(res);
      print(response);
      print(response['ErrorCode']);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF2553E5),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Visit Information",
          style:
              TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          patientName = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Patient Name",
                        hintStyle: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFE9EDFF),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              patientAgeYear = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Age(Year)",
                            hintStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFE9EDFF),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              patientAgeMonth = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Age(Month)",
                            hintStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          patientWeight = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight(kg)",
                        hintStyle: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Container(
                  height: 150.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: TextField(
                          // controller: _controller,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              patientProblem = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Briefly describe the problem",
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Container(
                  height: 150.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: TextField(
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //prefixIcon: Image(image: AssetImage("assets/images/link-file.png"), height: 20.h, width: 20.h, color: Color(0xFF2553E5),),
                            hintText:
                                "Attach reports and prescriptions\nJPEC, PNG, PDF\n(maximam number of file 10)",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2553E5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  makeAppoinment();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Confirmation(
                        doctorName: widget.doctorName,
                        appoinmentFee: widget.appoinmentFee,
                        appoinmentDate: widget.appoinmentDate,
                        appoinmentSlot: widget.appoinmentSlot,
                        patientName: patientName,
                        patientAgeYear: patientAgeYear,
                        patientAgeMonth: patientAgeMonth,
                        patientWeight: patientWeight,
                        patientProblem: patientProblem,
                        patientReport: patientReport,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 35.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF2553E5),
                    borderRadius: BorderRadius.circular(10.h),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Proceed Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
