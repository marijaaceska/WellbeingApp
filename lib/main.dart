import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/morning_challenge_screen.dart';
import 'screens/stress_diary_screen.dart';
import 'screens/habit_tracker_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(WellbeingApp());
}

class WellbeingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibrant Wellbeing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins', // Optional custom font
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    MorningChallengeScreen(),
    StressDiaryScreen(),
    HabitTrackerScreen(),
    ProfileScreen(),
  ];

  final _titles = [
    'Welcome',
    'Morning Challenge',
    'Stress Diary',
    'Habit Tracker',
    'Profile Details',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: 'Morning'),
    BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Diary'),
    BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Habits'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: _navBarItems,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple[50],
      ),
    );
  }
}
