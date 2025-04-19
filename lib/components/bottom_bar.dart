import 'package:flutter/material.dart';
import 'package:parking_app/booking_history.dart';
import 'package:parking_app/main.dart';
import 'package:parking_app/view/registration_page.dart';
import 'package:parking_app/view/login_page.dart';

class HomeWithBottomBar extends StatefulWidget {
  @override
  _HomeWithBottomBarState createState() => _HomeWithBottomBarState();
}

class _HomeWithBottomBarState extends State<HomeWithBottomBar> {
  int _selectedIndex = 0;

  // Define pages here
  final List<Widget> _pages = [
    MyHomePage(title: 'Home Page'), // Replace with your home page widget
    BookingHistoryScreen(),
    RegistrationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
