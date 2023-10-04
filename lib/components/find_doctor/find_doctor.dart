import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  String searchValue = "";
  Map<String, String> doctorNameTag = {
    "Abdul Hasan": "Thank you for being a great doctor",
    "Hasan Mahmud": "Thank you for being a great doctor",
    "Shah Newaz": "Thank you for being a great doctor",
    "Yeasir Arafat": "Thank you for being a great doctor",
    "Jubair Ahmed": "Thank you for being a great doctor",
  };

  List<String> filteredDoctorNames = [];

  @override
  void initState() {
    super.initState();
    filteredDoctorNames.addAll(doctorNameTag.keys);
  }

  void filterLabTests(String query) {
    setState(() {
      filteredDoctorNames = doctorNameTag.keys
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
              color: const Color(0xFF4368FF),
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
                              image: const AssetImage("assets/images/Logo.png"),
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
                                        builder: (context) => const Cart()));
                              },
                              child: Image(
                                image: const AssetImage("assets/images/cart.png"),
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
                                      builder: (context) => const Notifications()),
                                );
                              },
                              child: Image(
                                image: const AssetImage("assets/images/bell.png"),
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
                                    builder: (context) => const HomeMenu(),
                                  ),
                                );
                              },
                              child: Image(
                                image: const AssetImage("assets/images/menu.png"),
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
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 40.0, right: 40.0),
                                  child: Text(
                                    'Find your Doctor',
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
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Find by Name, Speciality',
                          prefixIcon: const Icon(Icons.search, size: 30),
                          // alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                    SizedBox(height: 10.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredDoctorNames.length,
                      itemBuilder: (context, index) {
                        final doctorName = filteredDoctorNames[index];
                        final doctorTag = doctorNameTag[doctorName];

                        return _buildFeatureRow(
                          text1: doctorName, // lab test name
                          text2: doctorTag, // lab test fee
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SizedBox(
                    height: 18.h,
                  ),
                  //text
                  Text(
                    "Find us on Social Media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2553E5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //social
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/twitter.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/instagram.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/messenger.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/whatsapp.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/linkedin.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/gmail.png",
                        width: 18.w,
                        height: 18.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFeatureRow({required String text1, required String? text2}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
    child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              SizedBox(height: 10.h),
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                text2!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 95, 95, 95),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    const Icon(Icons.call, size: 40, color: Colors.grey),
  ],
)

  );
}

Widget _buildPackageContainer({required String text}) {
  return Container(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.h),
      color: const Color(0xFF4368FF),
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 5),
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
