import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_lab/Views/home/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_lab/Core/api_client.dart';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';



class Personalinfo extends StatefulWidget {
  const Personalinfo({Key? key}) : super(key: key);

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   TextEditingController NameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController _dateControler = TextEditingController();
   TextEditingController WeightController = TextEditingController();
   TextEditingController AddressController = TextEditingController();


  late Map<String, dynamic> userData;

  final ApiClient _apiClient = ApiClient();
  bool isChecked = false;
  String selectedGender = 'Male';
  String userName = "";
  String userPhone = "";
  String userBirthday = "";
  String userWeight = "";
  String userAddress = "";


  final storage = const FlutterSecureStorage();



  @override
  void initState() {
    checkdata();
    super.initState();
  }




  final picker = ImagePicker();
  XFile? _image;
  File? _imageFile;


  Future<void> _getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,

        ],
      );

      setState(() {
        _image = croppedImage != null ? XFile(croppedImage.path) : null;
      });

      storeImageFile(_imageFile!).then((_) {
        setState(() {
          _imageFile = File(_image!.path);

        });
      });

      if (_imageFile != null) {
        // If a new image is selected, add it to the userData
        userData["img"] = await MultipartFile.fromFile(_imageFile!.path, filename: 'userimg.jpg');
      }

    }
  }

  Future<void> storeImageFile(File imageFile) async {
    // Get the app's document directory path
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;

    // Get the file name from the image file path
    final String fileName = imageFile.path.split('/').last;

    // Define a new path in the app's document directory to store the image file
    final String newPath = '$appDocPath/$fileName';

    // Copy the image file to the new path
    await imageFile.copy(newPath);

    // Store the new path (or the image URL) in secure storage
    await storage.write(key: 'img', value: newPath);

  }



  Future<File?> getImageFile() async {
    // Read the stored image path from secure storage
    String? imagePath = await storage.read(key: 'img');

    // If imagePath is null or empty, return null
    if (imagePath == null || imagePath.isEmpty) {
      return null;
    }

    // Create a File object from the stored image path
    File imageFile = File(imagePath);

    // Return the File object representing the image file
    return imageFile;
  }



  Future<void> checkdata() async {
    String? userNameTmp = await storage.read(key: 'Name');
    String? userPhoneTmp = await storage.read(key: 'Phone');
    String? userageTmp = await storage.read(key: 'age');
    String? userweightTmp = await storage.read(key: 'weight');
    String? userAddressTmp = await storage.read(key: 'Address');
    _imageFile = await getImageFile();


    setState(() {
      userName = userNameTmp ?? "";
      userPhone = userPhoneTmp ?? "";
      userBirthday = userageTmp ?? ""; // Set to empty string if userageTmp is null
      userWeight = userweightTmp ?? "";
      userAddress = userAddressTmp ?? "";
    });



//print('username  ${userName}');
    NameController = TextEditingController(text: userName);
    phoneController = TextEditingController(text: userPhone);
    _dateControler = TextEditingController(text: userBirthday);
    WeightController = TextEditingController(text: userWeight);
    AddressController = TextEditingController(text: userAddress);
  }











  Future<void> registerUsers() async {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      userData = {

        "Weight": WeightController.text,
        "NAME": NameController.text,
        "Phone": phoneController.text,
        "Address": AddressController.text,
        "BirthDate": _dateControler.text,

      };

      dynamic res = await _apiClient.updateUser(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      var response = json.decode(res);
     // print(response['ErrorCode']);
      if (response['ErrorCode'] == null) {
        await storage.write(key: 'Name', value: NameController.text);
        await storage.write(key: 'Phone', value: phoneController.text);
        await storage.write(key: 'age', value: _dateControler.text);
        await storage.write(key: 'weight', value: WeightController.text);
        await storage.write(key: 'Address', value: AddressController.text);


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
                // Add space between back button and image

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(),),);
                        },
                      ),

                      SizedBox(width: 10.0), // Add space between back button and image


                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 125,), // Adjust top and left padding here
                        child:  Stack(

                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: _imageFile != null
                                  ? FileImage(File(_imageFile!.path))
                                  : AssetImage("assets/images/doctor.png") as ImageProvider<Object>?,
                              child: _imageFile != null
                                  ? null
                                  : Icon(
                                Icons.add_a_photo,
                                size: 40.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            Positioned(
                              top: 50,
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  Map<Permission, PermissionStatus> status = await [
                                    Permission.storage,
                                    Permission.camera,
                                  ].request();

                                  if(status[Permission.storage]!.isGranted || status[Permission.camera]!.isGranted){
                                    _getImage();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("No Permission Provided"),
                                      backgroundColor: Colors.red.shade300,
                                    ));



                                  }





                                },
                              child: Transform.translate(
                                offset: const Offset(0, 15), // Adjust offset to move the icon
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                  size: 34.0, // Adjust the size as needed




                                ),
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                      // Add any other widgets or spacing as needed
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),

                //sign up
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(),),);
                  //  Navigator.pop(context);


                    },


                  child: Container(
                    height: 35.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2553E5),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(

                      child: Text("My Information",
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
                      border: Border.all(color: const Color(0xFF2553E5), width: 2),
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
                      border: Border.all(color: const Color(0xFF2553E5), width: 2),
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
                      border: Border.all(color: const Color(0xFF2553E5), width: 2),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _dateControler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Select Birthyear",
                          filled: false,
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                        ),
                        readOnly: true,
                        onTap: (){

                          _selectDate();
                        },
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
                      border: Border.all(color: const Color(0xFF2553E5), width: 2),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,

                        controller: WeightController,
                        decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "Weight",
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
                      border: Border.all(color: const Color(0xFF2553E5), width: 2),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,

                        controller: AddressController,
                        decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "Your Address",
                          hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),




















                //checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: const Color(0xFF2553E5),
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
                            fontSize: 12.sp,
                            color: Colors.grey[900],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),),);
                          },
                          child: Text("Terms & Conditions",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF2553E5),
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

                    if(isChecked == true) {
                      registerUsers();
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomBar(),),);


                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                      color: const Color(0xFF2553E5),
                      borderRadius: BorderRadius.circular(10.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("Save",
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

              ],
            ),
          ),
        ),
      ),

    );
  }

  Future<void> _selectDate() async {
   DateTime? _picked= await showDatePicker(
        context: context,
       initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

   if(_picked != null){
     setState(() {
       _dateControler.text = _picked.toString().split(" ")[0];
     });
   }

  }


}

