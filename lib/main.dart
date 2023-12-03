import 'package:easy_lab/Views/intro/launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Theme/ThemeChanger.dart';



ThemeData _buildLightTheme() {
  return ThemeData.light().copyWith(

    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      color: Color(0xFF2553E5), // Set the default app bar color
    ),
    // Define other properties of the light theme
  );
}








void main() {


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF2553E5),
  ));




  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(_buildLightTheme()), // Initial theme
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LauncherScreen(),
        );
      }
    );
  }
}

