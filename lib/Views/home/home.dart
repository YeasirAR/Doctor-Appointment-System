import 'dart:convert';

import 'package:easy_lab/Views/home/all_doctors.dart';
import 'package:easy_lab/components/call_doctor/call_doctor.dart';
import 'package:easy_lab/components/find_doctor/find_doctor.dart';
import 'package:easy_lab/components/health_package/package.dart';
import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:easy_lab/components/lab_test/lab_tests.dart';
import 'package:easy_lab/components/special_offers/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';


import '../../Core/api_client.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Position _currentPosition = Position(
    latitude: 0.0,
    longitude: 0.0,
    altitude: 0.0,
    accuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    heading: 0.0,
    timestamp: DateTime.now(),
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0, // Provide a default value for altitudeAccuracy
  );



  final ApiClient _apiClient = ApiClient();

  final storage = FlutterSecureStorage();
  bool isLoading = true;
  String? userName = "";
  String? userPhone = "";
  String? userType = "";
  String? userCoin = "6000";
  String? FjsonString = "";




  String selectedMenuItem = '';
  List<String> menuItems = ["Refferal Points", "Membership", "Discount", "Pharmacy","Health Tips"];
  List<String> menuIcons = ["assets/images/menuperson.png", "assets/images/vip.png", "assets/images/discount.png", "assets/images/first-aid-kit.png", "assets/images/healthcare.png"];
  List<Map<String, dynamic>> zipLists(List<String> list1, List<String> list2) {
    List<Map<String, dynamic>> zippedList = [];
    for (int i = 0; i < list1.length; i++) {
      zippedList.add({
        'text': list1[i],
        'icon': list2[i],
      });
    }
    return zippedList;
  }




  @override
  void initState() {

   // _checkLocationPermission();
    GetUsersdata();
    super.initState();




  }











    Future<void> _checkLocationPermission() async {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await _requestLocationPermission();
      } else if (permission == LocationPermission.deniedForever) {
        // Handle the case where the user has permanently denied location permission
        print("Location permission permanently denied");
      } else {
        _getLocation();
      }
    }

    Future<void> _requestLocationPermission() async {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where the user denied location permission
        print("Location permission denied");
      } else if (permission == LocationPermission.deniedForever) {
        // Handle the case where the user permanently denied location permission
        print("Location permission permanently denied");
      } else {
        _getLocation();
      }
    }

    Future<void> _getLocation() async {

    print(" getting location: ");
    try {
      Geolocator.getPositionStream().listen((Position position) {
        setState(() {
          _currentPosition = position;
        });

         storage.write(key: 'Latitude', value: position.latitude.toString());
         storage.write(key: 'Longitude', value: position.longitude.toString());
         storage.write(key: 'Accuracy', value: position.accuracy.toString());
        print("Latitude: ${position.latitude}");
        print("Longitude: ${position.longitude}");
        print("Accuracy: ${position.accuracy}");
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }









/*
  Future<void> _refresh() async {

    await Future.delayed(Duration(seconds: 2));

    // Update the UI with the new data or any changes
    setState(() {
      // Example: Add new items to the list
      GetUsersdata();
    });
  }
*/


  Future<void> GetUsersdata() async {
    // Retrieving user data from storage
    String? userNameTmp = await storage.read(key: 'Name');
    String? userTypeTmp = await storage.read(key: 'User_Type');
    String? userPhoneTmp = await storage.read(key: 'Phone');
    String? jsonString = await storage.read(key: 'Doctors');
    setState(() {
      userName = userNameTmp;
      userPhone = userPhoneTmp!;
      userType = userTypeTmp!;
    });

    // Processing the retrieved data
    final String doctorsJson = jsonString ?? await DefaultAssetBundle.of(context).loadString('assets/JSON/Doctor_list.json');







    final List<dynamic> doctorsData = json.decode(doctorsJson);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));

    // Constructing user data map
    Map<String, dynamic> userData = {
      "Name": userName,
      "Phone": userPhone
    };

    // Calling API to get users data
    dynamic res = await _apiClient.GetUsersdata(userData);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Handling API response
    var response = json.decode(res);




    if (response['ErrorCode'] == "200") {
      // Updating local storage with received user data
      await storage.write(key: 'Name', value: response['Name']);
      await storage.write(key: 'Phone', value: response['Phone']);
      await storage.write(key: 'Coin', value: response['Coin']);
      await storage.write(key: 'Doctors', value: response['Doctors']);

      //print(response['Doctors']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${response['Message']}'),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(


        child: Column(
          children: [
            Container(
              height: 135.h,
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
                                showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(
                                      MediaQuery.of(context).size.width,
                                      70.h,
                                      0,
                                      0),
                                  items: zipLists(menuItems, menuIcons).map((item) {
                                return PopupMenuItem<String>(
                                      value: item ['text'],
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(item['icon']),
                                            color: Color(0xFF4368FF),
                                            height: 25.h,
                                            width: 25.h,
                                          ),
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          Text(
                                            item['text'],
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedMenuItem = value;
                                    });
                                  }
                                });
                              },
                              child: Image(
                                image: AssetImage("assets/images/menu.png"),
                                height: 25.h,
                                width: 25.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.h),
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
                      height: 30.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
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
                      child: Row(
                        children: [
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: TextField(
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0xFF4368FF),
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search by symptoms or doctor',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 10.sp),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Icon(
                                        Icons.search,
                                        color: Color(0xFF4368FF),
                                      ),
                                    ),
                                  ),
                                  autocorrect: true,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/menu2.png",
                            color: Color(0xFF4368FF),
                            height: 18.h,
                            width: 18.w,
                          ),
                          SizedBox(width: 12.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            //body
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    "Choose Your Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2553E5),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  //pics1
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallDoctor()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 1.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Call \nDoctor",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                    builder: (context) => FindDoctor()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 2.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Find your \nDoctor",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                    builder: (context) => EasyPackage()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 3.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Easy Health \nPackages",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //pics2
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Offers()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 4.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Special \noffers",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                    builder: (context) => LabTests()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: SvgPicture.asset(
                                    'assets/images/Artboard 5.svg',
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Lab \nTest",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.h),
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 6.svg',
                                  width: 100.w,
                                  height: 100.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "More\n ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //refer
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // Share the text when tapped

                      // await Share.share('check out my website https://example.com');
                      },
                    child: Container(
                      height: 80.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, top: 10.h),
                            child: Text(
                              "Refer & Earn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, top: 6.h),
                            child: Row(
                              children: [
                                Text(
                                  "share ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "EasyLab ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "with your friends",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              top: 3.h,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "and keep earning ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "৳40 ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "for each successful refer.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                    height: 40.h,
                  ),
                  //text
                  Text(
                    "Consult our Specialist",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2553E5),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //pics3
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 7.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Dental",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 8.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Dental",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 9.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Medicine",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 10.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Neurosurgeon",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  //pics4
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 1 copy.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Dermatologist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 2 copy.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Physician",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 3 copy.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Gynecologist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: SvgPicture.asset(
                                  'assets/images/Artboard 4 copy.svg',
                                  height: 75.h,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "More",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  //text
                  Text(
                    "Consult our Specialist",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2553E5),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //doctor
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.h),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/doctor.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Dr. Karim",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Dermatologist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.h),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/doctor.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Dr. Karim",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Dermatologist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E5F7),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.h),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/doctor.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Dr. Karim",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Dermatologist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2553E5),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDoctors()));
                              },
                              child: Container(
                                height: 75.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E5F7),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.h),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/doctor.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDoctors()));
                              },
                              child: Text(
                                "More\n ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF2553E5),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  //bottom container
                  Container(
                    height: 135.h,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF2553E5),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage("assets/images/Logo.png"),
                                height: 60.h,
                                width: 60.w,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: Text(
                                  "Saving Times, Saves Lives.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 27.h, right: 10.w),
                              child: Text(
                                "Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, sed \ndiam nonummy nibh euismod \nut laoreet dolore magna aliquam \nerat volutpat. Ut wisi enim ad \nminim veniam, quis nostrud exerci \nullamcorper suscipi",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}







SnackBar getResultSnackBar(ShareResult result) {
  return SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Share result: ${result.status}"),
        if (result.status == ShareResultStatus.success)
          Text("Shared to: ${result.raw}")
      ],
    ),
  );
}