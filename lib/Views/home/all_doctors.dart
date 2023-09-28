import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart.dart';
import 'doctor_details.dart';






class Doctor {
  final String name;
  final String specialty;
  final String image;
  final String S_About;
  final String Phone;
  final String L_About;
  final String Spe_about;
  final String Patients;
  final String Experiences;
  final String Review;
  final String Location;




  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    required this.S_About,
    required this.Phone,
    required this.L_About,
    required this.Spe_about,
    required this.Patients,
    required this.Experiences,
    required this.Review,
    required this.Location,
  });




  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'image': image,
      'S_About': S_About,
      'Phone': Phone,
      'L_About': L_About,
      'Spe_about': Spe_about,
      'Patients': Patients,
      'Experiences': Experiences,
      'Review': Review,
      'Location': Location,
    };
  }


  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      image: json['image'],
      S_About: json['S_About'],
      Phone: json['Phone'],
      L_About: json['L_About'],
      Spe_about: json['Spe_about'],
      Patients: json['Patients'],
      Experiences: json['Experiences'],
      Review: json['Review'],
      Location: json['Location'],
    );
  }
}


class DoctorInfo {
  final List<Map<String, dynamic>> data;

  DoctorInfo(this.data);
}






Future<List<Doctor>> loadDoctors(BuildContext context) async {
  final String doctorsJson = await DefaultAssetBundle.of(context).loadString('assets/JSON/Doctor_list.json');
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
            padding: EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: doctors!.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.h),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(doctor.image),
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
                            height: 26.h,
                            width: 100.w,
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
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
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