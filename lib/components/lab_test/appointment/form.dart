import 'package:easy_lab/Views/clock/confirmation.dart';
import 'package:easy_lab/components/lab_test/appointment/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:easy_lab/Core/api_client.dart';

class AppointmentForm extends StatefulWidget {
  // const DoctorForm({Key? key}) : super(key: key);
  // final String packageName;
  // final String packageFee;
  List<String> selectedTestsNames;
  int selectedPackageFee;
  final String appoinmentDate;
  final String appoinmentSlot;

  AppointmentForm({
    required this.selectedTestsNames,
    required this.selectedPackageFee,
    required this.appoinmentDate,
    required this.appoinmentSlot,
  });

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final ApiClient _apiClient = ApiClient();

  String patientName = "";
  String patientAgeYear = "";
  String patientAgeMonth = "";
  String patientWeight = "";
  String patientProblem = "";
  String patientReport = "";
  String testName = "";
  String totalCost = "";
  String phoneNo = "";
  String address = "";
  String sampleCollection = 'Lab Collection';

  var sampleCollectionOpt = [
    'Lab Collection',
    'Home Collection',
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> makeAppoinment() async {
      Map<String, dynamic> appoinmentInfo = {
        "SelectedTestsNames": widget.selectedTestsNames,
        "SelectedTestsFees": widget.selectedPackageFee,
        "AppoinmentDate": widget.appoinmentDate,
        "AppoinmentSlot": widget.appoinmentSlot,
        "PatientName": patientName,
        "PatientAgeYear": patientAgeYear,
        "PatientAgeMonth": patientAgeMonth,
        "PatientWeight": patientWeight,
        "PhoneNo": phoneNo,
        "Address": address,
        "SampleCollection": sampleCollection,
      };
      print(appoinmentInfo);

      // dynamic res = await _apiClient.makeAppoinmentHealthPackage(appoinmentInfo);
      // var response = json.decode(res);
      // print(response);
      // print(response['ErrorCode']);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
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
                          phoneNo = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
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
                          address = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Address",
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: DropdownButton(
                      value: sampleCollection,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: sampleCollectionOpt.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          sampleCollection = newValue!;
                        });
                      },
                    ),
                  ),
                ),
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
                    child: Text(
                  "Total Cost: " + widget.selectedPackageFee.toString() + " BDT",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: Color(0xFF4368FF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  widget.selectedTestsNames
                      .toString()
                      .replaceAll("[", " ")
                      .replaceAll("]", "")
                      .replaceAll(",", "\n"),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //       left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.h),
              //     color: Color.fromARGB(255, 48, 219, 5),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black38.withOpacity(0.2),
              //         spreadRadius: 5,
              //         blurRadius: 7,
              //         offset: Offset(0, 5),
              //       ),
              //     ],
              //   ),
              //   child: Text(
              //     "Total Cost: " + widget.selectedPackageFee.toString() + " BDT",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20.sp,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 15.h,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.h),
              //   child: Container(
              //     height: 150.h,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFE9EDFF),
              //       borderRadius: BorderRadius.circular(10.h),
              //     ),
              //     child: Stack(
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.only(left: 15.w),
              //           child: TextField(
              //             maxLines: null,
              //             textAlignVertical: TextAlignVertical.top,
              //             textAlign: TextAlign.center,
              //             decoration: InputDecoration(
              //               border: InputBorder.none,
              //               //prefixIcon: Image(image: AssetImage("assets/images/link-file.png"), height: 20.h, width: 20.h, color: Color(0xFF2553E5),),
              //               hintText:
              //                   "Attach reports and prescriptions\nJPEC, PNG, PDF\n(maximam number of file 10)",
              //               hintStyle: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Color(0xFF2553E5),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              InkWell(
                onTap: () {
                  if (patientName == "" ||
                      patientAgeYear == "" ||
                      patientAgeMonth == "" ||
                      patientWeight == "" ||
                      phoneNo == "" ||
                      address == ""
                      ) {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: Text("Error"),
                    //       content: Text("Please fill up all the fields"),
                    //       actions: [
                    //         TextButton(
                    //           onPressed: () {
                    //             Navigator.pop(context);
                    //           },
                    //           child: Text("OK"),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill up all the fields',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    makeAppoinment();
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmAppoinment(
                          selectedTestsNames: widget.selectedTestsNames,
                          selectedPackageFee: widget.selectedPackageFee,
                          appoinmentDate: widget.appoinmentDate,
                          appoinmentSlot: widget.appoinmentSlot,
                          patientName: patientName,
                          patientAgeYear: patientAgeYear,
                          patientAgeMonth: patientAgeMonth,
                          patientWeight: patientWeight,
                          phoneNo : phoneNo,
                          address : address,
                          sampleCollection : sampleCollection,
                        ),
                      ),
                    );
                  }
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
