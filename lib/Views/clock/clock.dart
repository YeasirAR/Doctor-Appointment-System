import 'package:easy_lab/Views/clock/visit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {

  final Map<String, dynamic>? Send; // Using nullable for the Send data


  Clock({required this.Send});

 // const Clock({Key? key, required Map<String, dynamic> Send}) : super(key: key);


  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  List<bool> isPressedListMonth = List.generate(7, (_) => false);
  List<bool> isPressedMorning = List.generate(7, (_) => false);
  List<bool> isPressedAfternoon = List.generate(7, (_) => false);
  List<bool> isPressedNight = List.generate(7, (_) => false);
  List<bool> isPressedSlot = List.generate(15, (_) => false);

  String doctorName = "Doctor X";
  String appoinmentFee = "500";
  String appoinmentDate = "";
  String appoinmentSlot = "";








  void selectOptionMonth(int selectedIndex) {
    for (int index = 0; index < isPressedListMonth.length; index++) {
      setState(() {
        if (index == selectedIndex) {
          isPressedListMonth[index] = true;
        } else {
          isPressedListMonth[index] = false;
        }
      });
    }
  }

  void selectOptionSlot(int selectedIndex) {
    for (int index = 0; index < isPressedSlot.length; index++) {
      setState(() {
        if (index == selectedIndex) {
          isPressedSlot[index] = true;
          if (index < 5) {
            appoinmentSlot = getMorningTimes(index);
          } else if (index < 10) {
            appoinmentSlot = getAfternoonTimes(index - 5);
          } else {
            appoinmentSlot = getNightTimes(index - 10);
          }
        } else {
          isPressedSlot[index] = false;
        }
      });
    }
  }

  final currentTime = DateTime.now();

  String getMonthName() {
    final DateTime now = DateTime.now();
    final DateTime futureDate = now.add(Duration(days: 7));

    final DateFormat currentMonthFormatter = DateFormat.MMMM();
    final DateFormat nextMonthFormatter = DateFormat.MMMM();

    final String currentMonthName = currentMonthFormatter.format(now);
    final String futureMonthName = nextMonthFormatter.format(futureDate);

    return (now.month == futureDate.month)
        ? currentMonthName
        : '$currentMonthName - $futureMonthName';
  }

  String getDayName(int index) {
    final DateTime now = DateTime.now();
    final DateTime targetDate = now.add(Duration(days: index));
    final DateFormat formatter = DateFormat('EEE');
    final String dayName = formatter.format(targetDate).toUpperCase();
    return dayName;
  }

  String getDate(int index) {
    final DateTime now = DateTime.now();
    final DateTime targetDate = now.add(Duration(days: index));
    final int dayOfMonth = targetDate.day;
    final String formattedDate =
        '${targetDate.day.toString().padLeft(2, '0')}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.year}';
    appoinmentDate = formattedDate;
    return dayOfMonth.toString();
  }

  String getMorningTimes(int index) {
    switch (index) {
      case 0:
        return "09:00 AM";
      case 1:
        return "09:30 AM";
      case 2:
        return "10:00 AM";
      case 3:
        return "10:30 AM";
      case 4:
        return "11:00 AM";
      case 5:
        return "11:30 AM";
      default:
        return "";
    }
  }

  String getAfternoonTimes(int index) {
    switch (index) {
      case 0:
        return "02:00 PM";
      case 1:
        return "02:30 PM";
      case 2:
        return "03:00 PM";
      case 3:
        return "03:30 PM";
      case 4:
        return "04:00 PM";
      default:
        return "";
    }
  }

  String getNightTimes(int index) {
    switch (index) {
      case 0:
        return "07:00 PM";
      case 1:
        return "07:30 PM";
      case 2:
        return "08:00 PM";
      case 3:
        return "08:30 PM";
      case 4:
        return "09:00 PM";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Appoinment",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xFF2553E5),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18.h,
              ),
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
                            backgroundImage:
                                AssetImage("assets/images/doctor.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Consultation fee",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF2553E5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                                Text(
                                  "৳500",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 38.sp, fontFamily: 'Helvetica'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getMonthName(),
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0; index < 7; index++)
                                Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      selectOptionMonth(index);
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: isPressedListMonth[index]
                                            ? Color(0xFF2553E5)
                                            : Color(0xFFD5DAF2),
                                        borderRadius:
                                            BorderRadius.circular(8.h),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              getDayName(index),
                                              style: TextStyle(
                                                color: isPressedListMonth[index]
                                                    ? Colors.white
                                                    : Color(0xFF2553E5),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              getDate(index),
                                              style: TextStyle(
                                                color: isPressedListMonth[index]
                                                    ? Colors.white
                                                    : Color(0xFF2553E5),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morning Slots",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0; index < 5; index++)
                                Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectOptionSlot(index);
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: isPressedSlot[index]
                                            ? Color(0xFF2553E5)
                                            : Color(0xFFD5DAF2),
                                        borderRadius:
                                            BorderRadius.circular(5.h),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              getMorningTimes(index),
                                              style: TextStyle(
                                                color: isPressedSlot[index]
                                                    ? Colors.white
                                                    : Color(0xFF2553E5),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Afternoon Slots",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 5; index < 10; index++)
                                Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectOptionSlot(index);
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: isPressedSlot[index]
                                            ? Color(0xFF2553E5)
                                            : Color(0xFFD5DAF2),
                                        borderRadius:
                                            BorderRadius.circular(5.h),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              getAfternoonTimes(index - 5),
                                              style: TextStyle(
                                                color: isPressedSlot[index]
                                                    ? Colors.white
                                                    : Color(0xFF2553E5),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Night Slots",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 10; index < 15; index++)
                                Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectOptionSlot(index);
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: isPressedSlot[index]
                                            ? Color(0xFF2553E5)
                                            : Color(0xFFD5DAF2),
                                        borderRadius:
                                            BorderRadius.circular(5.h),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              getNightTimes(index - 10),
                                              style: TextStyle(
                                                color: isPressedSlot[index]
                                                    ? Colors.white
                                                    : Color(0xFF2553E5),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {



                  doctorName = widget.Send?['name'] ?? "Doctor X";
                  appoinmentFee = widget.Send?['fee'].toString() ?? "500";





                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorForm(
                        doctorName: doctorName,
                        appoinmentFee: appoinmentFee,
                        appoinmentDate: appoinmentDate,
                        appoinmentSlot: appoinmentSlot,
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
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
