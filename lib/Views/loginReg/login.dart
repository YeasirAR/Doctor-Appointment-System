import 'dart:convert';

import 'package:easy_lab/Views/home/bottom_bar.dart';
import 'package:easy_lab/Views/loginReg/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_lab/Core/api_client.dart';
import 'package:easy_lab/utils/validator.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;
  bool isChecked = false;
  final storage = const FlutterSecureStorage();





















  Future<void> login() async {
    if (true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "Phone": emailController.text,
        "Password": passwordController.text
      };

      dynamic res = await _apiClient.login(emailController.text,passwordController.text);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      var response = json.decode(res);
      print(response);

      if (response['ErrorCode'] == null ) {




        await storage.write(key: 'Name', value: response['Name']);
        await storage.write(key: 'User_Type', value: response['User_Type']);
        await storage.write(key: 'Phone', value: response['Phone']);





       Navigator.push(context,
           MaterialPageRoute(builder: (context) => MyBottomBar()));
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(),),);onPressed: registerUsers,

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${response['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
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
                SizedBox(height: 20.h,),

                //image
                Center(
                  child: Image(
                    image: AssetImage(
                        "assets/images/Logo2.png"
                    ),
                    height: 120.h,
                    width: 120.w,
                  ),
                ),

                SizedBox(height: 20.h,),

                Center(
                  child: Text(" Hello again!",
                    style: TextStyle(
                        color: Color(0xFF2553E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        fontFamily: 'Helvetica'
                    ),
                  ),
                ),

                SizedBox(height: 5.h,),

                Center(
                  child: Text("   Welcome back!",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 11.sp,
                        fontFamily: 'Helvetica'
                    ),
                  ),
                ),

                SizedBox(height: 50.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Container(
                    height: 40.h,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF2553E5), width: 2),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Center(
                      child: TextField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mobile Number or Email Address",
                          hintStyle: TextStyle(color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Container(
                    height: 40.h,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF2553E5), width: 2),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Center(
                      child: TextField(
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h,),

                Text("Forgot password?",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[900],
                  ),
                ),

                SizedBox(height: 45.h,),

                InkWell(
                  onTap: () {
                   login();
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => MyBottomBar(),),);
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
                      child: Text("Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica'
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 45.h,),

                Text("Or continue with",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[900],
                  ),
                ),

                SizedBox(height: 12.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          "assets/images/google.png"
                      ),
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(width: 15.w,),
                    Image(
                      image: AssetImage(
                          "assets/images/facebook.png"
                      ),
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(width: 15.w,),
                    Image(
                      image: AssetImage(
                          "assets/images/apple-logo.png"
                      ),
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),

                SizedBox(height: 40.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[900],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => Register(),),);
                      },
                      child: Text("Sign up",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFF2553E5),
                          fontWeight: FontWeight.bold,
                        ),
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

