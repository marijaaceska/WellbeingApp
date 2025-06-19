import 'package:flutter/material.dart';

class HabitTrackerCard extends StatefulWidget {
  @override
  _HabitTrackerCardState createState() => _HabitTrackerCardState();
}

class _HabitTrackerCardState extends State<HabitTrackerCard> {
  final Map<String, bool> habits = {
    'Drink 8 glasses of water': false,
    'Exercise for 30 minutes': false,
    'Meditate for 10 minutes': false,
    'Read for 20 minutes': false,
    'Sleep at least 7 hours': false,
    'Limit social media to 30 mins': false,
    'Eat at least 3 servings of veggies': false,
    'Practice mindfulness during breaks': false,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 12,
      shadowColor: Colors.greenAccent.withOpacity(0.6),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade300, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green.shade800, size: 32),
                SizedBox(width: 12),
                Text(
                  'Habit Tracker',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.green.shade300,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...habits.keys.map(
                  (habit) => CheckboxListTile(
                activeColor: Colors.green.shade700,
                checkColor: Colors.white,
                title: Text(
                  habit,
                  style: TextStyle(fontSize: 18, color: Colors.green.shade900),
                ),
                value: habits[habit],
                onChanged: (value) {
                  setState(() {
                    habits[habit] = value ?? false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
