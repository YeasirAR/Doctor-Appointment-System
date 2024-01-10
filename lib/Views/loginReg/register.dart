import 'dart:convert';

import 'package:easy_lab/Views/home/bottom_bar.dart';
import 'package:easy_lab/Views/loginReg/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_lab/Core/api_client.dart';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController GenderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ReferralController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;
  bool isChecked = false;
  String selectedGender = 'Male';
  final storage = const FlutterSecureStorage();


  Future<void> registerUsers() async {
    if (true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "Email": [
          {
            "Type": "Primary",
            "Value": phoneController.text,
            "Phone": phoneController.text
          }
        ],
        "Password": passwordController.text,
        "NAME": NameController.text,
        "Ref" : ReferralController.text,
        "About": 'I am a new user :smile:',
        "FirstName": "Test",
        "LastName": "Account",
        "FullName": "Test Account",
        "BirthDate": "10-12-1985",
        "Gender": "M",
      };

      dynamic res = await _apiClient.registerUser(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      var response = json.decode(res);
      print(response['ErrorCode']);
      if (response['ErrorCode'] == null) {




        await storage.write(key: 'Name', value: response['Name']);
        await storage.write(key: 'User_Type', value: response['User_Type']);
        await storage.write(key: 'Phone', value: response['Phone']);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text( response['Message']),
    backgroundColor: Colors.green.shade300,
    ));



        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  MyBottomBar()));
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
      body: Form(
        child: SafeArea(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),

              //image
              Center(
                child: Image(
                  image: AssetImage(
                      "assets/images/Logo.png"
                  ),
                  height: 120.h,
                  width:120.w,
                ),
              ),

              // Center(
              //   child: Text("Easy Lab",
              //     style: TextStyle(
              //         color: Color(0xFF2553E5),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20.sp,
              //         fontFamily: 'Helvetica'
              //     ),
              //   ),
              // ),


              SizedBox(height: 20.h,),

              //sign up
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
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
                    child: Text("Sign Up",
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

              SizedBox(height: 50.h,),

              //name
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2553E5), width: 2),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      controller: NameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Full Name",
                        hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h,),

              //mobile email
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2553E5), width: 2),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      controller: phoneController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h,),



              //Referral
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2553E5), width: 2),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: ReferralController,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: "Referral (Optional)",
                        hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h,),
              //password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2553E5), width: 2),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h,),

              //checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Color(0xFF2553E5),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text("I agree with the ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[900],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),),);
                        },
                        child: Text("Terms & Conditions",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF2553E5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 3.h,),

              //create account
              InkWell(
                onTap: () {


                  // Validate name length
                  if (NameController.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Name should be at least 6 characters.'),
                      backgroundColor: Colors.red.shade300,
                    ));
                    return; // Stop the registration process if validation fails
                  }

                  // Validate phone number length
                  if (phoneController.text.length != 11) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Phone number should be 11 digits.'),
                      backgroundColor: Colors.red.shade300,
                    ));
                    return; // Stop the registration process if validation fails
                  }

                  // Validate password length
                  if (passwordController.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Password should be at least 6 characters.'),
                      backgroundColor: Colors.red.shade300,
                    ));
                    return; // Stop the registration process if validation fails
                  }






                  if(isChecked == true) {
                    registerUsers();
                   //Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(),),);


                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Check & agree with the Terms & Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color(0xFF2553E5),
                    ));
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
                    child: Text("Create Account",
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

              SizedBox(height: 18.h,),

              //login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[900],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
                    },
                    child: Text("Log in",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xFF2553E5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

