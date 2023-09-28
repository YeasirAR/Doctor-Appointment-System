import 'package:easy_lab/Views/clock/clock.dart';
import 'package:easy_lab/Views/heart/heart.dart';
import 'package:easy_lab/Views/home/home.dart';
import 'package:easy_lab/Views/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../person/person.dart';

class MyBottomBar extends StatefulWidget {
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = [
    Home(),
    Clock(),
    Heart(),
    Message(),
    Person(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildBottomNavigationBarItem(Icons.home_filled, Icons.home_outlined, 0),
          buildBottomNavigationBarItem(Icons.watch_later, Icons.watch_later_outlined, 1),
          buildBottomNavigationBarItem(Icons.favorite, Icons.favorite_border, 2),
          buildBottomNavigationBarItem(Icons.message, Icons.message_outlined, 3),
          buildBottomNavigationBarItem(Icons.person_2_rounded, Icons.person_2_outlined, 4),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.grey[700],
        selectedIconTheme: IconThemeData(color: Color(0xFF2553E5),),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData filledIcon, IconData outlinedIcon, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          borderRadius: BorderRadius.circular(24.h),
          splashColor: Colors.blue.withOpacity(0.2),
          child: Icon(
            _selectedIndex == index ? filledIcon : outlinedIcon,
            size: 20.h,
          ),
        ),
      ),
      label: '',
    );
  }
}
