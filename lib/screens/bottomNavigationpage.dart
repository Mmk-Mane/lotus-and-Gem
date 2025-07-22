import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lotusandgems/screens/chart_page.dart';
import 'package:lotusandgems/screens/explore_page.dart';
import 'package:lotusandgems/screens/home_page.dart';
import 'package:lotusandgems/screens/profile_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0; // Tracks the current tab index

  // List of screens to display
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    GoldRateChartPage(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex, // Display the selected screen
        children: _screens,
      ),
      bottomNavigationBar:  Container(
        height: 70, // Adjust the height here
        decoration: BoxDecoration(
          color: MKColors.bottomBarBackground, // Optional: Background color
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),        child: SalomonBottomBar(
          itemPadding: EdgeInsets.symmetric(
            vertical: 10,  // Increase this value to make the bar taller
            horizontal: 16,
          ),

          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Ionicons.home_outline),
              title: Text('Home'),
              selectedColor: MKColors.bottomBarSelected,
              unselectedColor: MKColors.bottomBarUnselected,
            ),
            SalomonBottomBarItem(
              icon: Icon(Ionicons.compass_outline),
              title: Text('Explore'),
              selectedColor: MKColors.bottomBarSelected,
              unselectedColor: MKColors.bottomBarUnselected,
            ),
            SalomonBottomBarItem(
              icon: Icon(Ionicons.stats_chart_outline),
              title: Text('Chart'),
              selectedColor: MKColors.bottomBarSelected,
              unselectedColor: MKColors.bottomBarUnselected,
            ),

            SalomonBottomBarItem(
              icon: Icon(Ionicons.people_circle_outline),
              title: Text('Profile'),
              selectedColor: MKColors.bottomBarSelected,
              unselectedColor: MKColors.bottomBarUnselected,
            ),
          ],
        ),
      ),
    );
  }
}
