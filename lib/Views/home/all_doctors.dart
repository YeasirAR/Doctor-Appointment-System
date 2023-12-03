import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/doctor.dart';
import 'cart.dart';
import 'doctor_details.dart';




class DoctorInfo {
  final List<Map<String, dynamic>> data;

  DoctorInfo(this.data);
}






Future<List<Doctor>> loadDoctors(BuildContext context) async {

  final storage = FlutterSecureStorage();
  String? jsonString = await storage.read(key: 'Doctors');



  final String doctorsJson = jsonString ?? await DefaultAssetBundle.of(context).loadString('assets/JSON/Doctor_list.json');

  //final String doctorsJson = await DefaultAssetBundle.of(context).loadString('assets/JSON/Doctor_list.json');


  final List<dynamic> doctorsData = json.decode(doctorsJson);
  return doctorsData.map((data) => Doctor.fromJson(data)).toList();
}




class DoctorList extends StatelessWidget {









  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Doctor>>(
      future: loadDoctors(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final doctors = snapshot.data;

          return Padding(
            padding: EdgeInsets.all(2.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: doctors!.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(1.h),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(doctor.image),
                              radius: 35.0,
                            ),
                          ),




                          Text(
                            doctor.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2553E5),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Specialty: ${doctor.specialty}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () {




                              final doctor2 = doctors[index];

                              Doctor doctor = Doctor(
                                name: doctor2.name,
                                specialty: doctor2.specialty,
                                image: doctor2.image,
                                S_About: doctor2.S_About,
                                Spe_about: doctor2.Spe_about,
                                Patients: doctor2.Patients,
                                Experiences: doctor2.Experiences,
                                Review: doctor2.Review,
                                Location: doctor2.Location,
                                Phone:doctor2.Phone,
                                L_About: doctor2.L_About ,

                              );


                              Map<String, dynamic> jsonData = doctor.toJson();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetails(

                                      MjsonData:jsonData

                                  ),
                                ),
                              );


                            },
                            child: Container(
                              height: 20.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: Color(0xFF2553E5),
                                borderRadius: BorderRadius.circular(8.h),
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
                                  "Appointment",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13.0,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}







class AllDoctors extends StatelessWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF2553E5),), // Replace with your custom icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("All Doctors", style: TextStyle(color: Color(0xFF2553E5), fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: DoctorList(),
    );
  }
}