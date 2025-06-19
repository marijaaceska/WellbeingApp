import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "Marija Aceska";
  final String email = "marija.aceska@mail.com";
  final int challengesCompleted = 15;
  final int habitsTracked = 22;
  final int diaryEntries = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade200, Colors.purple.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/profile_photo.png'),
          ),
          SizedBox(height: 16),
          Text(
            userName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(fontSize: 16, color: Colors.purple.shade700),
          ),
          SizedBox(height: 32),
          _buildStatRow('Challenges Completed', challengesCompleted, Colors.deepPurple),
          SizedBox(height: 16),
          _buildStatRow('Habits Tracked', habitsTracked, Colors.deepPurpleAccent),
          SizedBox(height: 16),
          _buildStatRow('Diary Entries', diaryEntries, Colors.purpleAccent),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Placeholder for logout or settings
            },
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade800,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: color)),
        Text(value.toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}
