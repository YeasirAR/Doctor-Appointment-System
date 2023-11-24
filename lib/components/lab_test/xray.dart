import 'package:easy_lab/Views/home/cart.dart';
import 'package:easy_lab/Views/home/home_menu.dart';
import 'package:easy_lab/Views/home/notification.dart';
import 'package:easy_lab/components/lab_test/appointment/timing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Xray extends StatefulWidget {
  const Xray({Key? key}) : super(key: key);

  @override
  State<Xray> createState() => _XrayState();
}

// List<int> selectedTests = List<int>.generate(4, (i) => 0);
class _XrayState extends State<Xray> {
  String searchValue = "";
  Map<String, int> labTests = {
    "Serum Calcium": 800,
    "ANTI THYROID AB": 2000,
    "Biopsy": 600,
    "FT4": 800,
    "LH": 800,
    "PSA": 800,
    "S. TSH": 800,
    "S.Prolactin": 800,
    "S.Testosterone": 800,
    "Serum IgE": 800,
    "T3": 800,
    "T4": 800,
    "1 1/2 HRS ABF": 200,
    "1 1/2 HRS ABF 2": 200,
    "1 1/2 HRS ABF WITH CUS": 250,
    "1 1/2 HRS AFTER 75gm GLUCOSE": 250,
    "2 HRS ABF WITH CUS": 250,
    "2 hrs AD": 150,
    "2 HRS AFTER 70gm GLUCOSE": 200,
    "2 HRS AFTER MEAL": 200,
    "2 hrs AL": 200,
    "24 Hrs Total Protein": 500,
    "2hrs ABF": 200,
    "2hrs after75 Gram Glucose": 250,
    "ACR": 800,
    "Aldehyde Test": 200,
    "Aldolase": 600,
    "Ascitic Fluid for Protein": 200,
    "Ascitic Fluid Protein": 200,
    "Ascitic Fluid Sugar": 150,
    "AT": 500,
    "Blood Group": 200,
    "Blood Sugar": 150,
    "Blood Sugar (2Hrs After 75 gm Glu)": 150,
    "Blood Sugar F and 2hs ABF": 300,
    "Blood Sugar F and 2hs ABF..": 100,
    "Blood Urea": 250,
    "BT,CT": 150,
    "Calcitonin": 1500,
    "CBC (Full Blood Count)": 400,
    "Chlamydia lgG Antibod": 700,
    "ChlamydiaTrachomatis lgM": 700,
    "CKNAC": 800,
    "Creatinine Clrarance Rate": 800,
    "CSF for C/S": 300,
    "CSF for Chloride": 300,
    "CSF for Gramstain": 100,
    "CSF for Zn(AFB) Stain": 120,
    "CSF Magnesium": 500,
    "CUS": 100,
    "Dermatophagodies Petronyssinus": 1200,
    "Electrolytes": 800,
    "Estimation of Glomerular Filtration (eGFR)": 600,
    "F D P (Fibrin Degradation Prodiuct -Quantitative)": 4150,
    "Fasting": 100,
    "FBS": 150,
    "FBS With CUS": 200,
    "FBS, 2Hrs ABF With CUS": 300,
    "FBS,2hrs ABF,2hrs AD,2hrs AL": 600,
    "Ferritin": 1500,
    "FNAC From Sweling Mask": 2000,
    "Folic Acid": 2000,
    "G6 PDH": 790,
    "Glucose Fasting": 100,
    "HA Test for Infectious Mononucleosis": 500,
    "HbA1c": 1100,
    "Hbs -Ag": 300,
    "HDL Cholesterol": 300,
    "Human Chorionic Gonadotropin (hCG)": 700,
    "Interleukin -6 ( IL -6)": 1500,
    "Iron Binding Capacity (Total) [TIBCT]": 800,
    "LDL -Cholesterol": 300,
    "LFT": 1000,
    "Lipid Profile": 1000,
    "Lipid Profile ( Fasting)": 1000,
    "Lithium": 500,
    "Magnesium": 1000,
    "Microalbumin": 500,
    "Modified GTT": 360,
    "Mycobacterium Tuberculosis (PCR)": 3500,
    "OGTT": 600,
    "OGTT 3 SAMPLE WITH CUS": 750,
    "PCR": 350,
    "PD Fluid for Protein": 200,
    "PD Fluid For Sugar": 100,
    "Plasma Factor IX Activity": 600,
    "Plasma Factor VIII Activity": 600,
    "Plasma Fibrinogen": 500,
    "Plasma Glucose 1 Hrs ABF": 120,
    "Plasma Glucose 1.5 Hrs ABF": 120,
    "Plasma Glucose 2 Hrs. ABF": 120,
    "Plasma Glucose 2.5 Hrs. ABF": 120,
    "Plasma Glucose 2h After 75g Glucose": 150,
    "Plasma Glucose 2h After Dinner": 120,
    "Plasma Glucose 2h After Lunch/Meal": 120,
    "Plasma Glucose Fasting": 120,
    "Plasma Gluecose Random": 120,
    "Plasma Haptoglobin": 850,
    "Pleural Fluid for C/S": 300,
    "Pleural Fluid for Gramstain": 120,
    "Pleural Fluid for Protein": 200,
    "Pleural fluid LDH": 1200,
    "Pleural Fluid Protein": 200,
    "Pleural Fluid Sugar": 150,
    "Potassium": 500,
    "Prealbumin": 500,
    "Prostatic Acid Phosphatase (PAP)": 800,
    "Prostatic Smear for Cytology": 250,
    "Prostatic Smear for Gramstain": 120,
    "Prostatic Smear for M/E": 120,
    "Protein Electrophoresis": 1100,
    "RA Test": 500,
    "RBS": 200,
    "RBS With CUS": 200,
    "S Gama-GT": 600,
    "S. Acid Phosphate": 300,
    "Serum Bilirubin": 200,
    "Serum C -Peptide": 4500,
    "Serum Cortisol": 1400,
    "Serum Globulin": 250,
    "Serum Iron": 0,
    "Serum lgA": 690,
    "Serum lgG": 690,
    "Serum lgM": 690,
    "Serum Meal of Double Contrast": 1500,
    "Serum TG": 300,
    "Serum TIBC": 1000,
    "Serum TIBC1": 1000,
    "Serum Total Protein": 300,
    "Serum Vitamin B-12": 2000,
    "Serum.Lipase": 800,
    "SGOT": 300,
    "SGPT": 300,
    "Sugar (2HABF)": 150,
    "TG": 250,
    "TP.ALB/GLB": 500,
    "Transferin": 860,
    "Triglyceride": 250,
    "Troponin-I": 1100,
    "Umbical Swab for C/S": 300,
    "Urethral Swab For G/S": 250,
    "Valproic Acid": 800,
    "Vanillylmandelic Acid (VMA)": 900,
    "Bita Hcg ( Blood Pregnancy Test)": 1000,
    "Bl MP": 150,
    "C.E Count": 100,
    "CBC (Govt.)": 400,
    "Dengue IgG/IgM (Govt.)": 300,
    "Dengue Ns1 Antigen(govt.)": 300,
    "L.E Cell": 250,
    "MCHC": 150,
    "MCV": 150,
    "MP": 800,
    "Partial Thromboplastin Time": 450,
    "PCV": 150,
    "Platelet Count": 100,
    "Prothrombin Time": 280,
    "Reticulocyte Count": 500,
    "Alpha Fetoprotein": 800,
    "C E A": 1500,
    "CA -125": 1400,
    "CA 15-3": 1400,
    "CA 19-9": 1400,
    "Carcion Embryonic Ag ( CEA )": 1000,
    "Total Prostate Specific ( PSA )": 800,
    "Anti-MPO-Ab (p-ANCA)": 800,
    "Ascitic Fluid AFB": 200,
    "Ascitic Fluid of AFB Stain": 120,
    "Ascitic Fluid of Gram Stain": 120,
    "Aural swab C/S": 500,
    "Blood Film": 150,
    "CBC": 400,
    "HB Electrophoresis": 1150,
    "HB% (Haemoglobin)": 300,
    "Hb% TC. DC. ESR": 300,
    "HCT": 150,
    "Malaria Spot Test": 600,
    "Malarial Parasite": 1000,
    "MCH": 150,
    "Morphology RBC": 250,
    "PC": 250,
    "Prothrombin time with INR": 600,
    "TC": 120,
    "TC/DC": 250,
    "TCE COUNT": 250,
    "Total Circulating Eosinophil (TCE)": 120,
    "Total Eosinophil Count": 200,
    "Total R.B.C": 250,
    "U-P/T": 100,
    "WBC": 150,
    "Anti-HBc": 800,
    "Anti-HBc (IgM)": 800,
    "Anti-HBc (lgG)": 800,
    "Anti-HCV": 1000,
    "HBe Ab": 790,
    "HBeAg": 790,
    "HBs Ab": 550,
    "Anti Thyroid Anti Body": 2400,
    "Anti thyroid peroxide Ab (TPO)": 1400,
    "Anti- Nuclear Antibodies (ANA)": 750,
    "Anti- TPO Ab": 800,
    "Anti-HAV lgM": 800,
    "Anti-HEV lgM": 700,
    "HBsAb": 800,
    "HBsAg": 300,
    "HBsAg (Confirmatory)": 790,
    "HBsAg (Elisa)": 600,
    "HbsAg(ICT)": 500,
    "Histopathology Lt.Breast": 1200,
    "HIV Antibody ELISA": 1100,
    "HIV p24 Antigen & Anti HIV- 1 & 2 Antibody": 700,
    "HSV Type I & II lgG Antibody": 700,
    "HSV Type I & II lgM Antibody": 980,
    "HSV1 IgG": 1200,
    "HSV1 IgM": 1200,
    "HSV2 IgG": 1200,
    "HSV2 IgM": 1200,
    "S. Vit. D3": 4200,
    "Scl -70 (Ab)": 1500,
    "Screening Test (HBsAg)": 700,
    "Screening Test (HBsAg,Anti HCV,HIV,TPHA,Malaria)": 1200,
    "Tachrolimus": 4400,
    "Thuroglobulin Antibody": 800,
    "Thyroglobulin": 800,
    "Thyroid Uptake": 800,
    "TORCH Antibody Titre": 8000,
    "Total -hCG(Beta- hCG)": 800,
    "Total thyroxine (T4)": 600,
    "Total tri-iodothyronine (T3)": 800,
    "TPHA": 600,
    "Tyroxine-Binding Globulin": 800,
    "VDRL (Quantitative)": 450,
    "VDRL(Q+Q)": 400,
    "Vitamin D Level": 2800,
    "Widal Test": 350,
    "Medical-3-HBsAg.VDRL.U-R/E.CXR12": 400,
    "Ascitic Fluid ADA": 1400,
        "Ascitic Fluid C/S": 300,
    "Ascitic Fluid for Sugar": 100,
    "S. Aldolase": 600,
    "S. Folute Level": 1200,
    "Semen for C/S": 600,
    "Serum C3": 690,
    "Serum C4": 690,
    "Anti DNA": 1000,
    "Anti HBs A b": 800,
    "Anti- HBV DNA (PCR)": 10000,
    "Anti- NuclearFactor (ANF)": 750,
    "Anti- T Pallidum IgG Antibody (Syphilis -G)": 800,
    "Anti-Cardiolipin Antibody": 2450,
    "Anti-Cardiolipin Antibody lgG": 1250,
    "Anti-Cardiolipin Antibody lgM": 1250,
    "Anti-HBe ( HBeAb )": 790,
    "Anti-Mycobacteria lgA Antibody": 700,
    "Anti-Mycobacteria lgG Antibody": 700,
    "Anti-Mycobacteria lgM Antibody": 700,
    "ASO (immuno-turbidimetric)": 500,
    "Blood Grouping": 150,
    "Stool R/E": 200,
  };
  // init the list of selected tests with all 0s
  List<int> selectedTests = List<int>.generate(259, (i) => 0);

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
                scrollDirection: Axis.vertical,
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
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredLabTestNames.length,
                      itemBuilder: (context, index) {
                        final text1 = filteredLabTestNames[index];
                        final text2 = labTests[text1];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, 
                            children: [
                              Text(
                                text1.length > 30
                                    ? text1.substring(0, 29) + ".."
                                    : text1,
                                style: TextStyle(
                                  color: Color(0xFF4368FF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      text2!.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF4368FF),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selectedTests[index] == 0) {
                                          selectedTests[index] =
                                              int.parse(text2.toString());
                                        } else {
                                          selectedTests[index] = 0;
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 0.w, right: 0.w),
                                      backgroundColor: selectedTests[index] == 0
                                          ? Color(0xFF4368FF)
                                          : Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.h),
                                      ),
                                    ),
                                    child: Text(selectedTests[index] == 0
                                        ? "Select"
                                        : "Remove"),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                  int selectedPackageFee = 0;
                  for (int i = 0; i < selectedTests.length; i++) {
                    selectedPackageFee += selectedTests[i];
                  }
                  List<String> selectedTestsNames = [];
                  for (int i = 0; i < selectedTests.length; i++) {
                    if (selectedTests[i] != 0) {
                      selectedTestsNames.add(filteredLabTestNames[i]);
                    }
                  }
                  if(selectedPackageFee==0){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please select at least one test.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  else{
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentTime(
                        selectedTestsNames: selectedTestsNames,
                        selectedPackageFee: selectedPackageFee,
                        
                      ),
                    ),
                  );
                  }
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

// Widget _buildFeatureRow({required String text1, required String? text2, required int index}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment
//           .spaceBetween, // Align text1 to the left and text2 to the right
//       children: [
//         Text(
//           text1,
//           style: TextStyle(
//             color: Color(0xFF4368FF),
//             fontSize: 14.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: Text(
//                 text2!,
//                 style: TextStyle(
//                   color: Color(0xFF4368FF),
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ElevatedButton(onPressed: () {
//               setState(() {
//                 if(selectedTests[index]==0){
//                   selectedTests[index]=1;
//                 }
//                 else{
//                   selectedTests[index]=0;
//                 }
//               });
//             },style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.only(
//                      left: 0.w, right: 0.w),
//                   backgroundColor: selectedTests[index]==0? Color(0xFF4368FF) : Colors.red,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.h),
//                   ),
//                 ), child: Text(selectedTests[index]==0? "Select" : "Remove"),)
//           ],
//         ),
//       ],
//     ),
//   );
// }

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
