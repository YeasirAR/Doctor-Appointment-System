import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:easy_lab/components/lab_test/appointment/timing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Cardiology extends StatefulWidget {
  const Cardiology({Key? key}) : super(key: key);

  @override
  State<Cardiology> createState() => _CardiologyState();
}

class _CardiologyState extends State<Cardiology> {
  String searchValue = "";
  Map<String, String> labTests = {
    "X": "2000",
    "Y": "3000",
    "Z": "4000",
    "W": "5000",
  };

  List<String> filteredLabTestNames = [];

  @override
  void initState() {
    super.initState();
    filteredLabTestNames.addAll(labTests.keys);
  }

  void filterLabTests(String query) {
    setState(() {
      filteredLabTestNames = labTests.keys
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 142.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF4368FF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.w, right: 23.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Image(
                              image: AssetImage("assets/images/Logo.png"),
                              height: 60.h,
                              width: 60.w,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              },
                              child: Image(
                                image: AssetImage("assets/images/cart.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notifications()),
                                );
                              },
                              child: Image(
                                image: AssetImage("assets/images/bell.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeMenu(),
                                  ),
                                );
                              },
                              child: Image(
                                image: AssetImage("assets/images/menu.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Text(
                      "Saving Times, Saves Lives.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      height: 38.h,
                      width: 310.w,
                      child: Center(
                        child: Container(
                          width: double
                              .infinity, // Ensure the container takes up the full width
                          child: Stack(
                            alignment: Alignment
                                .center, // Center the content of the Stack
                            children: <Widget>[
                              // First child (left-aligned)
                              Positioned(
                                left: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                    size: 36.0, // Adjust the size as needed
                                  ),
                                  onPressed: () {
                                    // Handle button press
                                    // pop to the previous screen
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              // Second child (centered)
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 65.0, right: 65.0),
                                  child: Text(
                                    'Lab Test',
                                    style: TextStyle(
                                      color: Color(0xFF4368FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
            // SizedBox(
            //   height: 8.h,
            // ),

            //body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchValue = value;
                            filterLabTests(
                                value); // Call the filtering function with the search query
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredLabTestNames.length,
                      itemBuilder: (context, index) {
                        final testName = filteredLabTestNames[index];
                        final testFee = labTests[testName];

                        return _buildFeatureRow(
                          text1: testName, // lab test name
                          text2: testFee, // lab test fee
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            Visibility(
              visible: !(MediaQuery.of(context).viewInsets.bottom > 0),
              child: SizedBox(
                height: 10.h,
              ),
            ),
            Visibility(
              visible: !(MediaQuery.of(context).viewInsets.bottom > 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentTime(
                        packageName: "Cardiology Test",
                        packageFee: "",
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
                  backgroundColor: Color(0xFF4368FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: const Text(
                  'Make an Appointment',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: !(MediaQuery.of(context).viewInsets.bottom > 0),
              child: SizedBox(
                height: 20.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildFeatureRow({required String text1, required String? text2}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Align text1 to the left and text2 to the right
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Color(0xFF4368FF),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2!,
          style: TextStyle(
            color: Color(0xFF4368FF),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildPackageContainer({required String text}) {
  return Container(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
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
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
