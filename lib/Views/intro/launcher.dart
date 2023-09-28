import 'dart:async';
import 'package:easy_lab/Views/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../home/bottom_bar.dart';

class LauncherScreen extends StatefulWidget {
  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {


  final storage = const FlutterSecureStorage();
  bool isLoading = true;





  // Check if auto-login is possible
  Future<void> checkAutoLogin() async {
    String? userName = await storage.read(key: 'Name');
    String? userType = await storage.read(key: 'User_Type');
    String? phone = await storage.read(key: 'Phone');

    if (userName != null && phone != null) {
      // Here, you might want to validate the token
      // For simplicity, we're not checking token expiration in this example

      // Perform an automatic login using the saved credentials
      // This could involve making an authenticated API request
      // to refresh the token if necessary
      // Replace this with your authentication logic

      // Simulating a successful login
      await Future.delayed(Duration(seconds: 2));

      // Navigate to the main screen (replace with your desired destination)
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyBottomBar(), // Replace with your main screen
      ));
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const Intro(),
          ),
        );
      });
      setState(() {
        isLoading = false;
      });
    }
  }




  @override
  void initState() {
    super.initState();
    checkAutoLogin();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h,),
              Image.asset(
                "assets/images/Logo.png", height: 120.h, width: 120.h,
              ),
              SizedBox(height: 220.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("An initiative of ",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  Text(" Medinet medical Limited",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
