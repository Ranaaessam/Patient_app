import 'package:idental_n_patient/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:idental_n_patient/history.dart';
import '../diagnois_icons.dart';
import '../profilePage.dart';
import '../select_model.dart';
import '../tabBarPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": HomePage()},
    {"screen": select_model()},
    {"screen": TabBarPage()},
    {"screen": HistoryScreen()},
    {"screen": profileScreen()}
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 9),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all((size.width / 28.0)),
            child: GNav(
              backgroundColor: Colors.white,
              color: Colors.teal,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.teal,
              gap: (size.width / 40.0),
              selectedIndex: _selectedScreenIndex,
              onTabChange: _onItemTapped,
              padding: EdgeInsets.symmetric(
                horizontal: (size.width / 28.0),
                vertical: (size.width / 35.0),
              ),
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconColor: Colors.black,
                  text: 'Home',
                ),
                GButton(
                  icon: Diagnois.stethoscope_solid,
                  iconColor: Colors.black,
                  text: 'Diagnosis',
                ),
                GButton(
                  icon: Icons.calendar_today,
                  iconColor: Colors.black,
                  text: 'Appointment',
                ),
                GButton(
                  icon: Icons.history,
                  iconColor: Colors.black,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: Colors.black,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
